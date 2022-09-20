class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
       validates :username, presence: true
    validates :username, :email, uniqueness: true    
 
  has_many :user_lists
  has_many :lists, through: :user_lists
end
