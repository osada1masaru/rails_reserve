class User < ApplicationRecord

  has_many :rooms
  has_many :reservations, foreign_key: 'User_id'
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_accessor :current_password

  validates :name, presence: true
end
