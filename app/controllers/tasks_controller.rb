class TasksController < ApplicationController
 before_action :task_params, only: [ :edit, :update]
  def index
    @list = List.find_by(params[:list_id])
    @task = Task.find_by(params[:list_id])
     
  end

def show
  @list = List.find_by(params[:list_id])
  @task = Task.find_by(params[:list_id])
end

 def new

    @list = List.find_by(id: params[:list_id])
    @task = Task.new
    @task.save

  end

 def create
     @list = List.find(params[:list_id])
    #@task = Task.new(task_params)
    # @task = Task.new
    @task = @list.tasks.build(task_params)
    #@task.save
    redirect_to @list
  end
  
  def edit
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to list_path(@task.list)
  end


  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to list_path(@task.list)
  end

  private
  
  def task_params
    params.require(:task).permit(:task, :completed, :due_date, :details)
     #params.permit(:task, :completed, :due_date, :details, :user_id, :list_id)
  end
end 
