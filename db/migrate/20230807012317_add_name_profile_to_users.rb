# frozen_string_literal: true

class AddNameProfileToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :profile, :text
  end
end
