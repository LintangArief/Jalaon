class Coupon < ActiveRecord::Base
  has_many :order_coupons
end
