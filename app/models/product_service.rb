class ProductService < ActiveRecord::Base
  belongs_to :service
  has_many :foto_product_services, :dependent => :destroy
  accepts_nested_attributes_for :foto_product_services, allow_destroy: true
end
