class RequestProduct < ActiveRecord::Base
  belongs_to :request
  belongs_to :product_service
  has_one :confirmation_request_product, :dependent => :destroy

  after_save :create_confirmation

  def create_confirmation
    if self.confirmation_request_product.nil?
      ConfirmationRequestProduct.new(request_product_id: self.id, status: 1, quantity_available: self.quantity).save
    end
  end

end