class ListsController < ApplicationController
  #before_action :require_login
  skip_before_action :verify_authenticity_token

  def index
    @user = User.find_by(@current_user)
    # @user_list = UserList.find_by(@current_user)
    @user_lists = UserList.all
    @lists = List.all
    @tasks = Task.find_by(params[:list_id])
  end

  def show
  
  @list = List.find_by(params[:id])
#  @tasks = Task.find_by(id: params[:list_id])
  #  @tasks = Task.find_by(list_id) 

 @tasks = Task.find_by(params[:list_id])
  end

 def new
    @list = List.new
    @list.tasks.build
   end


  def create
    @list = List.new(list_params)
    @list.task = @current_user
    if @list.save
      redirect_to @list
    else
      render :new
    end

  end

 def edit
  @list = List.find(params[:id])
  @task = Task.all
 end

 def update
  @list = List.find(params[:id])
  @task = Task.find_by(list_id: params[:id])
  @list.update(list_params)
  redirect_to @list
 end

  def destroy
    @list = List.find(params[:id])
    # @task = Task.find_by(params[:id])
    @task = Task.find_by(params[:id])
    # @task.destroy
    @list.destroy
    redirect_to list_path
  end

  private

  def list_params
    params.require(:list).permit(:name, tasks_attributes: [:task, :completed, :due_date, :details])
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id    
  end
end
