class FotoProductServicesController < ApplicationController
  def create
    @foto_product_service = FotoProductService.new(photo_params)
    @foto_product_service.save
  end
end
