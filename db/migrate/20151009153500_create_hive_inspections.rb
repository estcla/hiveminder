class CreateHiveInspections < ActiveRecord::Migration
  def change
    create_join_table :hives, :inspections do |t|
      t.integer :hive_id
      t.integer :inspection_id
    end
  end
end
