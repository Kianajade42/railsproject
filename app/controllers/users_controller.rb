class UsersController < ApplicationController


    def index
    # @user = User.find_by(@current_user)
    # @user_lists = User.by_name
    @user = User.all
    end
    
    def new
        @user = User.new
    end

    def create
   @user = User.find_by(username: params[:username])
   if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @user = User.find_by(id: params[:id]) 
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end
