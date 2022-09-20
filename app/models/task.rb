
class Task < ActiveRecord::Base
  
  belongs_to :list

  validates_presence_of :task, :details, presence: true

 
scope :most_recent, -> {order(created_at: :desc).limit(2)}

end
