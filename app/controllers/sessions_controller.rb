class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email].strip)
    if @user && @user.authenticate(params[:password].strip)
      session[:user_id] = @user.id
      redirect_to root_path
    else 
      flash[:notice] = "Create an account (Sign-Up) or enter correct details of an existing account to Login. Thank you!" 
      redirect_to login_path
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
