class AddHiveRefToInspections < ActiveRecord::Migration
  def change
    add_reference :inspections, :hive, index: true, foreign_key: true
  end
end
