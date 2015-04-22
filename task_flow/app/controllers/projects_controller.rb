class ProjectsController < ApplicationController

  def index
    @projects = @user.projects.all
  end

  def new
    @user = User.find(params[:id])
    @project = @user.projects.new
  end

  def show
    @project = User.project.find(params[:id])
  end

  def create
    @user = User.find(params[:id])
    @project = @user.projects.new(params.require(:project).permit(:name))

    @project.save
    redirect_to user_path(@user)
    
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

end
