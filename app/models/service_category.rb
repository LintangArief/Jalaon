class ServiceCategory < ActiveRecord::Base
  validates :name, presence: true
  has_many :services

end