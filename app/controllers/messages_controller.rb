class MessagesController < ApplicationController
  def index
    @messages = Current.user.messages
  end
  def new
    @message = Message.new
  end
  def create
    @message = Current.user.messages.new(message_params)

    if @message.save
      redirect_to messages_path, notice: "Message created successfully."
    else
      render :new, alert: "Message failed to create."
    end
  end
  private
  def message_params
    params.require(:message).permit(:subject, :body)
  end
end
