class HiveInspection < ActiveRecord::Base
  belongs_to :inspection
  belongs_to :hive
end
