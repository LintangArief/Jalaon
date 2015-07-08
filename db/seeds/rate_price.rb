rate_price = RatePrice.find_by(rate: 50000)
if rate_price.blank?
  rate_price = RatePrice.create!(rate: 50000, operator: "<", )
end

rate_price = RatePrice.find_by(rate: 100000)
if rate_price.blank?
  rate_price = RatePrice.create!(rate: 100000, operator: "<", )
end

rate_price = RatePrice.find_by(rate: 150000)
if rate_price.blank?
  rate_price = RatePrice.create!(rate: 150000, operator: "<", )
end

rate_price = RatePrice.find_by(rate: 250000)
if rate_price.blank?
  rate_price = RatePrice.create!(rate: 250000, operator: "<", )
end

rate_price = RatePrice.find_by(rate: 350000)
if rate_price.blank?
  rate_price = RatePrice.create!(rate: 350000, operator: "<", )
end

rate_price = RatePrice.find_by(rate: 500000)
if rate_price.blank?
  rate_price = RatePrice.create!(rate: 500000, operator: "<", )
end

rate_price = RatePrice.find_by(rate: 750000)
if rate_price.blank?
  rate_price = RatePrice.create!(rate: 750000, operator: "<", )
end

rate_price = RatePrice.find_by(rate: 1000000)
if rate_price.blank?
  rate_price = RatePrice.create!(rate: 1000000, operator: "<", )
end

rate_price = RatePrice.find_by(rate: 1000000)
if rate_price.blank?
  rate_price = RatePrice.create!(rate: 1000000, operator: ">", )
end