class VerifyUser < ActiveRecord::Base
  belongs_to :user
  mount_uploader :foto_ktp, AvatarVerifyUploader
  scope :pending, ->{where("verify_users.is_verify = false")}
  scope :success, -> {where("verify_users.is_verify = true")}
end
