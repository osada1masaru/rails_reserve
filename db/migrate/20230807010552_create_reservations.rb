# frozen_string_literal: true

class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :check_in
      t.date :check_out
      t.string :people
      t.string :total
      t.bigint :price

      t.timestamps
    end
  end
end
