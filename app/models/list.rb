class List < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  has_many :users, through: :tasks

  validates_presence_of :name, uniqueness: true

  accepts_nested_attributes_for :tasks

  
end
 
