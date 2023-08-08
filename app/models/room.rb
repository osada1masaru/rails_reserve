class Room < ApplicationRecord
  validates :name, :introductin, :price, :address, presence: true
end
