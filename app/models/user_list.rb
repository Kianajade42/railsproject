class UserList < ActiveRecord::Base
  belongs_to :user
  
   belongs_to :list

  #  has_many :tasks
    # scope :completed, -> {
  #   where(:completed => true)
  # }
  # scope :user_list, -> {where(user_id: "user_list")}
end
