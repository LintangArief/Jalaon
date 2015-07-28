class RequestProduct < ActiveRecord::Base
  belongs_to :request
  belongs_to :product_service
end
