class ServiceCategory < ActiveRecord::Base
  has_many :fields, class_name: "ServiceField"
  accepts_nested_attributes_for :fields, allow_destroy: true

  def self.show_all
    all.unshift(ServiceCategory.new({id: 0, name: "All Category"}))
  end
end