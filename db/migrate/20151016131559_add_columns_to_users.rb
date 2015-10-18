class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :location, :string
    add_column :users, :about, :string
    add_column :users, :experience, :string
    add_column :users, :profile_photo, :string
  end
end
