class Feedback < ActiveRecord::Base
  belongs_to :user
  belongs_to :product_service
end
