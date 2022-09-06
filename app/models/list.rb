class List < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  has_many :user_lists
  has_many :users, through: :user_lists

#scope :latest_something, -> {order(created_at: :desc).limit(3)}
  validates_presence_of :name, uniqueness: true

  accepts_nested_attributes_for :tasks

  
end
 