class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def new
    @users = User.new
  end
  
  def create
  @users = User.new(
  uid: params[:user][:uname], 
  password: params[:user][:password],
  password_confirmation: params[:user][:password_confirmation])
  
    if @users.save
      session[:uname] = params[:uname]
      session[:pass] = params[:pass]
      redirect_to root_path
  
    
    else 
    render new_user_path
    
    end
  end
  
  def destroy
    @users = User.find(params[:id])
    @users.destroy
    flash[:notice] = 'ユーザーを削除しました'
    redirect_to root_path
  end
  
 
end
