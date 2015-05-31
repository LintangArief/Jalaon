class ServiceCategory < ActiveRecord::Base
  validates :name, presence: true
end
