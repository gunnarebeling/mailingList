class SessionsController < ApplicationController
  def new
  end
  def create
    @user= User.find_by(email: params[:email])
    if @user.present? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Signed in!"
    else
      flash.now.alert = "Email or password is invalid"
      render :new
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Signed out!"
  end
end
