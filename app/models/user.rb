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
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, :omniauth_providers => [:facebook, :twitter]
  validates :email,
          :presence => true, 
          :uniqueness => {:case_sensitive => false },
          :if => 'provider.blank?'

  paginates_per 20
  has_many :services, :dependent => :destroy
  has_many :feedbacks, :dependent => :destroy
  has_one :verify_user, :dependent => :destroy
  has_many :deposits, :dependent => :destroy
  has_many :withdraws, :dependent => :destroy
  has_many :confirmation_deposits, :dependent => :destroy
  has_many :billing, :dependent => :destroy
  has_one :balance, :dependent => :destroy
  has_many :order_coupons
  has_many :requests

  scope :not_verify, ->{joins(:verify_user).where("verify_users.is_verify = false").all}
  scope :success_verify, -> {joins(:verify_user).where("verify_users.is_verify = true").all}

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

  def self.from_omniauth_twitter(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|  
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.nickname
      user.remote_image_url = auth.info.image
      user.twitter = auth.info.urls.Twitter
      user.confirmation_token = nil
      user.confirmed_at = Time.now.utc
    end
  end

  def self.from_omniauth_facebook(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.name
      user.remote_image_url = auth.info.image
      user.confirmation_token = nil
      user.confirmed_at = Time.now.utc
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      unless session["devise.facebook_data"].nil?
        if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
          user.email = data["email"] if user.email.blank?
        end
      end
      unless session["devise.twitter_data"].nil?
        if data = session["devise.twitter_data"] && session["devise.twitter_data"]["extra"]["raw_info"]
          user.email = data["email"] if user.email.blank?
        end
      end
    end
  end

  def email_required?
    super && provider.blank?
  end

  def current_password?
    provider.blank?
  end

end