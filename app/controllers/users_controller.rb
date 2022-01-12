class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = User.find_by(email: user_params[:email]).id
      redirect_to root_path
    else
      flash[:notice] = "Oop! Enter all ditails properly to continue. Thank you!"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
