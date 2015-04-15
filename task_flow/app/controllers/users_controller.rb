class UsersController < ApplicationController
  
  def profile
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user, :email, :username, :password))

    @user.save
  end

end
