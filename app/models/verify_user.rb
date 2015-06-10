class VerifyUser < ActiveRecord::Base
  belongs_to :user
  mount_uploader :foto_ktp, AvatarVerifyUploader
end
