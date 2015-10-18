class User < ActiveRecord::Base
  acts_as_tagger
  has_many :inspections, dependent: :destroy
  has_many :hives, dependent: :destroy

  mount_uploader :profile_photo, ProfilePhotoUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
