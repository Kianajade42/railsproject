class UserListController < ApplicationController
 def index
    @user_lists = UserList.all
 end
end