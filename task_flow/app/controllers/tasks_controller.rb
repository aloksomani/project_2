class TasksController < ApplicationController

  before_action :authenticate, only: [:show]
  before_action :correct_user, only: [:show]

  def index
    @milestone = Milestone.find(params[:id])
    @tasks = @milestone.tasks
  end

  def new
    @milestone = Milestone.find(params[:id])
    @task = @milestone.tasks.new
  end

  def show
    @task = Task.find(params[:id])
    @milestone = @task.milestone

  end

  def create
    @milestone = Milestone.find(params[:id])
    @task = @milestone.tasks.new(task_params)
    @task.completed = false
    @project = @milestone.project

    @task.save
    redirect_to project_milestone_path(@project.user, @project, @milestone)
  end

  def edit
    @task = Task.find(params[:id])
    @milestone = @task.milestone
  end

  def update
    @task = Task.find(params[:id])
    @milestone = @task.milestone
    @project = @milestone.project

    @task.completed = true

    if @task.save
      redirect_to project_milestone_path(@project.user, @project, @milestone)
    else
      render :new
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @milestone = @task.milestone
    @project = @milestone.project
    @task.destroy

    redirect_to project_milestone_path(@project, @milestone)
  end


  private
  def task_params
    params.require(:task).permit(:description)
  end

end
