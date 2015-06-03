class ServiceCategory < ActiveRecord::Base
  validates :name, presence: true
  has_many :services
  
  mount_uploader :avatar, AvatarServiceUploader
end