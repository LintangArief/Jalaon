class Withdraw < ActiveRecord::Base
  belongs_to :user
  belongs_to :billing
  belongs_to :bank_name

  scope :pendding, ->{where("withdraws.status = false")}
  scope :success, -> {where("withdraws.status = true")}
end
