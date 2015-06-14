class User < ActiveRecord::Base
  acts_as_messageable
  acts_as_follower
  mount_uploader :avatar, AvatarUserUploader
  include Amistad::FriendModel
  after_save :check_verify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates :first_name, :last_name, :email, presence: true
  paginates_per 20
  has_many :services
  has_many :feedbacks
  has_one :verify_user

  # acts_as_messageable :table_name => "messages"
  def check_verify
    checkverify = self.verify_user
    if checkverify == nil
      VerifyUser.create!(user_id: self.id)
    end
  end
  def name
    return false
  end
  #Returning the email address of the model if an email should be sent for this object (Message or Notification).
  #If no mail has to be sent, return nil.
  def mailboxer_email(object)
    #Check if an email should be sent for that object
    #if true
    return false
    #if false
    #return nil
  end
end