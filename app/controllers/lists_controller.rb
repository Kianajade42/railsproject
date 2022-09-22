class ListsController < ApplicationController
  #before_action :require_login
  skip_before_action :verify_authenticity_token

  def index
    @user = User.find_by(@current_user)
    @lists = List.all
    @list = Task.most_recent
  end

  def show
   @list = List.find_by(id: params[:id])
   @task = Task.find_by(id: params[:list_id])
   @user= User.find_by(params[:id])
  end

 def new
   @user = User.find_by(@current_user)
    @list = List.new
    @list.tasks.build
    # @list.save
   end


  def create
    @list = List.new(list_params)
    if @list.user_ids == @user.id
      @list.save
      redirect_to @list
    else
      flash[:notice] = "User ID must be your own"
      render :new
  
    end

  end

def edit
        @list = List.find_by(id: params[:id])
      
    end

    def update
        @list = List.find(params[:id])
        @list.update(list_params)
        redirect_to list_path(@list)
    end

  def destroy
  List.find(params[:id]).destroy
    redirect_to lists_path
  end


  private

  def list_params
    params.require(:list).permit(:name, :task, tasks_attributes: [:task, :completed, :due_date, :details, :user_id, :list_id])
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id    
  end
end
