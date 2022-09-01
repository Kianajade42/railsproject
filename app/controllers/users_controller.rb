class UsersController < ApplicationController

    def index
    @user = User.find_by(@current_user)
    @user_lists = UserList.all
    end
    
    def new
        @user = User.new
    end

    def create
        # @user = User.new(user_params)
        # if @user.save
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
        if @user == current_user
            render :show
        else
            flash[:message] = "No peeking! You can only see your own homepage."
            redirect_to user_path(current_user)
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end
