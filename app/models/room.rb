class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations
  
  has_one_attached :image
  
  with_options presence: true do
    validates :name
    validates :details
    validates :price
    validates :address
  end
end
