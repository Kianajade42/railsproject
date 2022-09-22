class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
       validates :username, presence: true
    validates :username, :email, uniqueness: true    


  has_many :tasks
  has_many :lists, through: :tasks

end
