class RequestCategory < ActiveRecord::Base
  belongs_to :service_category
  has_many :requests, :dependent => :destroy
  has_many :fields, class_name: "RequestField", :dependent => :destroy
  accepts_nested_attributes_for :fields, allow_destroy: true
end
