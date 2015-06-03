class Service < ActiveRecord::Base
  validates :service_category_id, presence: true
  paginates_per 10
  belongs_to :user
  belongs_to :service_category
  mount_uploader :avatar, AvatarServiceUploader
end
