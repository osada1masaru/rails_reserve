# frozen_string_literal: true

class ChangeDatatypePeopleOfReservations < ActiveRecord::Migration[6.1]
  def change
    change_column :reservations, :people, :integer
  end
end
