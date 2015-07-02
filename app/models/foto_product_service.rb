class FotoProductService < ActiveRecord::Base
  belongs_to :product_service
  # validates   :product_service_id, presence: true
  mount_uploader :avatar, AvatarFotoProductServiceUploader
end
