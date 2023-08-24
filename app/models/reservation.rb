class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  has_one_attached :image

  with_options presence: true do
    validates :check_in
    validates :check_out
    validates :people
  end

  validate :check_out_after_check_in

  def check_out_after_check_in
    if check_in.present? && check_out.present? && check_out <= check_in
      errors.add(:check_out, "の日付を正しく記入してください")
    end
  end
end
