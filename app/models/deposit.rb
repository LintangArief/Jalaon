class Deposit < ActiveRecord::Base
  belongs_to :user
  before_create :create_token_deposit
  has_one :confirmation_deposit

  def create_token_deposit
    if self.token.nil?
      self.token = self.created_at.to_i
    end
  end
end
