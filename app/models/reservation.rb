class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  has_one_attached :image

  with_options presence: true do
    validates :check_in
    validates :check_out
    validates :people
  end

  validate :start_end_check

  def start_end_check
    unless check_in == nil || check_out == nil
    errors.add(:check_out, "の日付を正しく記入してください") unless
    self.check_in < self.check_out
    end
  end
end
