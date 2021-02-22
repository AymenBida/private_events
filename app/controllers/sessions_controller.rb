class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:welcome, :new, :create]
  def welcome
  end

  def new
  end

  def create
    @user = User.find_by(username: user_params[:username])
    if @user
      session[:user_id] = @user.id
      flash[:success] = "You successfuly logged in !"
      redirect_to @user
    else
      flash.now[:error] = "Username don't exist, click on sign up to register"
      render :new
      
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to welcome_path
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
