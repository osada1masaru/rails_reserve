class Room < ApplicationRecord
  belongs_to :user
  
  has_many :reservations
  
  validates :name, presence: true
  validates :introductin, presence: true 
  validates :price, presence: true
  validates :address, presence: true
end
