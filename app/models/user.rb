class User < ActiveRecord::Base
  acts_as_tagger
  has_many :inspections, dependent: :destroy
  has_many :hives, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
