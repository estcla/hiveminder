class Hive < ActiveRecord::Base
  acts_as_taggable

  belongs_to :user
  has_many :inspections, dependent: :destroy

  validates :name, presence: true
  validates :location, presence: true
  validates :established, presence: true
  validates :health, presence: true

end
