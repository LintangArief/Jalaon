bank_name = BankName.find_by(name: "Bank Mandiri")
if bank_name.blank?
  bank_name = BankName.create!(name: "Bank Mandiri")
end

bank_name = BankName.find_by(name: "Bank Rakyat Indonesia")
if bank_name.blank?
  bank_name = BankName.create!(name: "Bank Rakyat Indonesia" )
end

bank_name = BankName.find_by(name: "Bank Central Asia")
if bank_name.blank?
  bank_name = BankName.create!(name: "Bank Central Asia")
end

bank_name = BankName.find_by(name: "BNI")
if bank_name.blank?
  bank_name = BankName.create!(name: "BNI")
end

bank_name = BankName.find_by(name: "CIMB Niaga")
if bank_name.blank?
  bank_name = BankName.create!(name: "CIMB Niaga")
end

bank_name = BankName.find_by(name: "Bank Mega")
if bank_name.blank?
  bank_name = BankName.create!(name: "Bank Mega")
end

bank_name = BankName.find_by(name: "Bank Permata")
if bank_name.blank?
  bank_name = BankName.create!(name: "Bank Permata")
end

bank_name = BankName.find_by(name: "Bank Panin")
if bank_name.blank?
  bank_name = BankName.create!(name: "Bank Panin")
end

bank_name = BankName.find_by(name: "BII")
if bank_name.blank?
  bank_name = BankName.create!(name: "BII")
end

bank_name = BankName.find_by(name: "Bank Danamon")
if bank_name.blank?
  bank_name = BankName.create!(name: "Bank Danamon")
end

bank_name = BankName.find_by(name: "BTN")
if bank_name.blank?
  bank_name = BankName.create!(name: "BTN")
end

bank_name = BankName.find_by(name: "Bank Bukopin")
if bank_name.blank?
  bank_name = BankName.create!(name: "Bank Bukopin")
end