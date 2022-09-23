class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
       validates :email, presence: true
    validates :email, :email, uniqueness: true    


  has_many :tasks
  has_many :lists, through: :tasks

end
