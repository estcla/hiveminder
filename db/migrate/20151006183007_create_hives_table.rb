class CreateHivesTable < ActiveRecord::Migration
  def change
    create_table :hives do |t|
      t.belongs_to :user, null: false
      t.string :name, null: false
      t.string :location, null: false
      t.string :established, null: false
      t.string :health, null: false

      t.timestamps
    end
  end
end
