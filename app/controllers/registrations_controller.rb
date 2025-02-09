class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end
  def create
    byebug
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Signed up!"
    else
      flash.now[:alert] = "Invalid email or password"
      render :new
    end
  end
  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
