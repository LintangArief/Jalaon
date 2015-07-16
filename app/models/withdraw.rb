class Withdraw < ActiveRecord::Base
  belongs_to :user
  belongs_to :billing
  belongs_to :bank_name
end
