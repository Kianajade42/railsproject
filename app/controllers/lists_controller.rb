class ListsController < ApplicationController
  #before_action :require_login
  skip_before_action :verify_authenticity_token

  def index
    @user = User.find_by(@current_user)
    # @user_list = UserList.find_by(@current_user)
    @lists = List.all
    # @tasks = Task.find_by(params[:list_id])
  end

  def show
     #@list = List.find(params[:id])
  @list = List.find_by(id: params[:id])
  @task = Task.find_by(id: params[:list_id])
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

#  def edit
#   @list = List.find(params[:id])
#   @task = Task.all
#  end

# def update
#     # @task = Task.find(params[:id])
#      @list = List.find(params[:id])
#      @task = Task.find_by(list_id: params[:id])
#      @list.update(list_params)

#     redirect_to list_path(@task.list)
#   end

#  def update
#   @list = List.find(params[:id])
  # @task = Task.find_by(list_id: params[:id])
#   @task = Task.find_by(id: params[:id])
#   @list.update(list_params)
#   redirect_to @list
#  end

def edit
        @list = List.find_by(id: params[:id])
            # render :edit
    end

    def update
        @list = List.find_by(id: params[:id])
        @list.update(list_params)
        redirect_to list_path(@list)
    end

  def destroy
    @list = List.find(params[:id])
    #  @list = List.find(params[:destroy_multiple])
    # @task = Task.find_by(params[:id])
    #@task = Task.find_by(params[:id])
    # @task.destroy
    @list.destroy
    redirect_to lists_path
  end

def destroy_multiple
    List.destroy(params[:list_ids])
  end

  private

  def list_params
    params.require(:list).permit(:name, tasks_attributes: [:task, :completed, :due_date, :details])
  end
# require(:list)
  def require_login
    return head(:forbidden) unless session.include? :user_id    
  end
end
