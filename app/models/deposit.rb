class Deposit < ActiveRecord::Base
  belongs_to :user
  before_create :create_token_deposit
  has_one :confirmation_deposit

  scope :pendding_transfer, ->{where("deposits.status = 1")}
  scope :pendding_balance, -> {where("deposits.status = 2")}
  scope :success, -> {where("deposits.status = 3")}
  
  def create_token_deposit
    if self.token.nil?
      self.token = self.created_at.to_i
    end
  end
end
