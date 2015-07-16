class Billing < ActiveRecord::Base
  belongs_to :bank_name
  belongs_to :user
end
