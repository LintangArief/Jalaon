class BankName < ActiveRecord::Base
  has_many :confirmation_deposits
end
