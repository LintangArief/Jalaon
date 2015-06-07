class ServiceCategory < ActiveRecord::Base
  has_many :fields, class_name: "ServiceField"
  accepts_nested_attributes_for :fields, allow_destroy: true
end