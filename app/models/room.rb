class Room < ApplicationRecord
  belongs_to :user
  
  has_many :reservations, foreign_key: 'Room_id'
  
  with_options presence: true do
    validates :name
    validates :detail
    validates :price
    validates :address
  end
end
