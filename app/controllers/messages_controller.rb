class MessagesController < ApplicationController
  def index
    @messages = Current.user.messages
  end
end
