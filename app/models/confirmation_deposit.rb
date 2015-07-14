class ConfirmationDeposit < ActiveRecord::Base
  belongs_to :deposit
  belongs_to :user
  belongs_to :bank_name
end
