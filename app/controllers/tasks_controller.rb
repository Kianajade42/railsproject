class TasksController < ApplicationController
  skip_before_action :verify_authenticity_token
#  before_action :task_params, only: [ :edit, :update, :index, :show]


  def index
    @tasks = Task.all
    @user = User.find_by(params[:id])
  end

def show
  @list = List.find_by(id: params[:list_id])
 @task = @list.tasks.find_by(id: params[:id])
 @user = User.find_by(params[:id])
end

 def new
  @list = List.find_by(id: params[:list_id])
   @task = Task.new
    @list = List.find_by(id: params[:list_id])
 end
 

 def create
   @task = Task.create(task_params)
  if   @task.save
   redirect_to tasks_path
    flash[:notice] = "New task saved."
  else
    flash[:notice] = "Not saved"
    render :new
  end
end
  
  def edit
    @task = Task.find(params[:id])
  end

def update 
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to list_tasks_path(@task)
end

  def destroy

    @task =  Task.find_by(id: params[:id]).destroy
   redirect_to list_tasks_path(@task)
  end


  private
  

  def task_params
     params.require(:task).permit(:task, :completed, :due_date, :details, :user_id, :list_id)
  end
end
 