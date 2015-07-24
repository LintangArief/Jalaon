class ProductServicesController < ApplicationController
 def create
    @service = Service.find(params[:product_service][:service_id])
    @productservice = @service.product_services.new(params_product_service)
    if @productservice.save
      if params[:avatar]
        params[:avatar].each { |avatar|
          @productservice.foto_product_services.create(avatar: avatar)
        }
      end
      flash[:notice] = "Your Product / Portofolio has been created."
      redirect_to @service
    else 
      flash[:alert] = "Something went wrong."
      redirect_to @service
    end
  end

  def update
    authorize @productservice
    if @productservice.update(params[:product_service].permit(:title,:description))
      # to handle multiple images upload on update when user add more picture
      if params[:avatar]
        params[:avatar].each { |avatar|
          @product_service.foto_product_services.create(avatar: avatar)
        }
      end
      flash[:notice] = "Album has been updated."
      redirect_to @service
    else
      redirect_to @service
    end
  end

  private
  def params_product_service
    params.require(:product_service).permit(:title, :description, :service_id, :price, :takeaway, :delivery)
  end
end