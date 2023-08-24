class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations
  
  has_one_attached :image

  def self.ransackable_attributes(auth_object = nil)
    ["address", "created_at", "details", "id", "image", "introduction", "name", "price", "updated_at", "user_id"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["image_attachment", "image_blob", "reservations", "user"]
  end


  with_options presence: true do
    validates :name
    validates :details
    validates :price
    validates :address
    validates :image
  end
end
