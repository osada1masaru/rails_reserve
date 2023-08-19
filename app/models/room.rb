class Room < ApplicationRecord
  belongs_to :user
  
  has_many :reservations
  
  with_options presence: true do
    validates :name
    validates :details
    validates :price
    validates :address
  end
end
