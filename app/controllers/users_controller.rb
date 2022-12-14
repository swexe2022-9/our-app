class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def new
    @users = User.new
  end
  
  def create
  @users = User.new(
  uname: params[:user][:uname],
  password: params[:user][:password],
  password_confirmation: params[:user][:password_confirmation],
  email: params[:user][:email])
  
    if @users.save
      redirect_to root_path
    else 
      render new_user_path
    end
    
  end
  
  def destroy
    @users = User.find(params[:id])
    @users.destroy
    redirect_to root_path
  end
  
 
end
