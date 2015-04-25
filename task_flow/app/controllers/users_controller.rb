 class UsersController < ApplicationController

  before_action :authenticate, only: [:show]
  before_action :correct_user, only: [:show]
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @project = Project.new
    @current_user = current_user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
