class Request < ActiveRecord::Base
  belongs_to :request_category
  belongs_to :user
  belongs_to :service
  has_many :request_products, :dependent => :destroy
  # validates :request_category_id, presence: true
end
