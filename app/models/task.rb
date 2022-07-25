

# # def completed 
# #    where(:completed => true)
# # end
#   scope :completed, -> {
#     where(:completed => true)
#   }

#   scope :todo, -> {
#     where(:completed => false)
#   }
  #scope :latest_something, -> {order(created_at: :desc).limit(3)}
  #scope :methodCreated, -> {joins(:TableName).}
# end

class Task < ActiveRecord::Base
  belongs_to :list
  # belongs_to :user
  # belongs_to :user, through: :user_list 
  validates_presence_of :task, :details, presence: true
  # :completed, :due_date, :details, :user_id, :list_id

end