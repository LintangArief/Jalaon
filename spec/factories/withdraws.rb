FactoryGirl.define do
  factory :withdraw do
    user nil
money "9.99"
billing nil
bank_name nil
account_number nil
account_name "MyString"
has_billing false
status false
  end

end
