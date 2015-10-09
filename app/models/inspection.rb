class Inspection < ActiveRecord::Base
  belongs_to :user
  has_many :hives, through: :hives_inspections

  validates :date, presence: true
  validates :time_of_day, presence: true
end
