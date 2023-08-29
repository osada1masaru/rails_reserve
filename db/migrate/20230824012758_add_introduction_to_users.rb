# frozen_string_literal: true

class AddIntroductionToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :introduction, :text
    add_column :users, :profile_image, :string
  end
end
