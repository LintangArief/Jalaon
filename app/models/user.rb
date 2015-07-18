class User < ActiveRecord::Base
  acts_as_messageable
  acts_as_follower
  acts_as_reader
  mount_uploader :avatar, AvatarUserUploader
  include Amistad::FriendModel
  include PublicActivity::Model
  tracked

  
  after_save :check_verify
  after_save :create_balance
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates :first_name, :last_name, :email, presence: true
  paginates_per 20
  has_many :services
  has_many :feedbacks
  has_one :verify_user
  has_many :deposits
  has_many :withdraws
  has_many :confirmation_deposits
  has_many :billing
  has_one :balance
  has_many :carts

  # acts_as_messageable :table_name => "messages"
  def check_verify
    checkverify = self.verify_user
    if checkverify == nil
      VerifyUser.create!(user_id: self.id)
    end
  end

  def create_balance
    check_balance = self.balance
    if check_balance == nil
      Balance.create!(user_id: self.id)
    end
  end

  def name
    return false
  end
  
  def mailboxer_email(object)
    return false
  end
end