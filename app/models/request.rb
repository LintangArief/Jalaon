class Request < ActiveRecord::Base
  belongs_to :request_category
  belongs_to :user
  belongs_to :service
  has_many :request_products, :dependent => :destroy
  has_one :confirmation_request, :dependent => :destroy

  after_save :create_confirmation

  def create_confirmation
    if self.confirmation_request.nil?
      ConfirmationRequest.new(request_id: self.id, status: 1, delivery_fee: 0.0).save
    end
  end
end
