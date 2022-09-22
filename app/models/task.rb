
class Task < ActiveRecord::Base
  
belongs_to :list
belongs_to :user 

validates_presence_of :task, :details, :user_id, presence: true

 
scope :most_recent, -> {order(created_at: :desc).limit(2)}

end
