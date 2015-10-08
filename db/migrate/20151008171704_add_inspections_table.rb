class AddInspectionsTable < ActiveRecord::Migration
  def change
    create_table :inspections do |t|
      t.string :date, null: false
      t.string :time_of_day, null: false

      t.belongs_to :user, null: false

      t.timestamps
    end
  end
end
