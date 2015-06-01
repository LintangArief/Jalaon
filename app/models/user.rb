class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates :first_name, :last_name, :email, presence: true

  mount_uploader :avatar, AvatarUserUploader
  include Amistad::FriendModel
  searchkick word_middle: [:last_name, :first_name, :city, :state]
  paginates_per 20

end