class List < ActiveRecord::Base
  has_many :tasks
  #has_many :user_lists
   has_many :user_lists, through: :user
# scope :list, -> {order(created_at: :desc).limit(3)}
#scope :latest_something, -> {order(created_at: :desc).limit(3)}
  validates_presence_of :name, uniqueness: true

  accepts_nested_attributes_for :tasks
  
end
 