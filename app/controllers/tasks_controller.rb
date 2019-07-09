class TasksController < ApplicationController
  def list
    @tasks = Task.all
  end

  def details
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    redirect_to details_path(@task)
    @task.save
  end

  def edit
    @task = Task.find(params[:id])
  end

  def delete
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to details_path(@tasks)
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to details_path(@task)
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

end
