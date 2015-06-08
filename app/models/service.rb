class Service < ActiveRecord::Base


  validates :service_category_id, presence: true
  paginates_per 10
  has_many :product_services
  belongs_to :user
  belongs_to :service_category
  mount_uploader :avatar, AvatarServiceUploader
  validate :validate_properties
  
  def validate_properties
    service_category.fields.each do |field|
      if field.required? && properties[field.name].blank?
        errors.add field.name, "must not be blank"
      end
    end
  end


end
