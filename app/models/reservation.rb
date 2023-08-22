class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  with_options presence: true do
    validates :check_in
    validates :check_out
    validates :pepple
  end

  validate :check_out_check

  def :check_out_check
    errors.add(:check_out, "の日付を正しく記入してください") unless
    self.check_in < self.check_out
    end
  end
end
