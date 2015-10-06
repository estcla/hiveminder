class Hive < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :location, presence: true
  validates :established, presence: true
  validates :health, presence: true
end
