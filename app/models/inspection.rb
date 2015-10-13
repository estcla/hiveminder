class Inspection < ActiveRecord::Base
  acts_as_taggable
  acts_as_taggable_on :tags

  belongs_to :user
  has_many :hives

  validates :date, presence: true
  validates :time_of_day, presence: true
end
