class RequestCategory < ActiveRecord::Base
  belongs_to :service_category
  has_many :request
  has_many :fields, class_name: "RequestField"
  accepts_nested_attributes_for :fields, allow_destroy: true
end
