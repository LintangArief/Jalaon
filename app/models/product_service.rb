class ProductService < ActiveRecord::Base
  belongs_to :service
  has_many :foto_product_services, :inverse_of => :product_service, :dependent => :destroy
  # enable nested attributes for photos through album class
  accepts_nested_attributes_for :foto_product_services, allow_destroy: true
end
