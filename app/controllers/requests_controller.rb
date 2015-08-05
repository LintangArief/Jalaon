class RequestsController < ApplicationController
  def new
  end

  def create
    @service = Service.find(params[:request][:service_id])
    if current_user.requests.joins(:confirmation_request).where(confirmation_requests: {status: [1,2,3]}, service_id: @service.id).count == 0
      @request = current_user.requests.new(request_params)
      if @request.save
        if params[:has_product] == "true"
          count_request_product = params[:product_ids].count
          (0...count_request_product).each {|i|
            if params[:product_quantity_ids][i].to_i > 0
              @request.request_products.new(product_service_id: params[:product_ids][i], quantity: params[:product_quantity_ids][i].to_i).save
            end
          }
          respond_to do |format|
            format.html{
              redirect_to @service, notice: "Your Request Has Been Save, Please Wait Confirmation from Owner Service"
            }
          end
        else
          respond_to do |format|
            format.html{
              redirect_to @service, notice: "Your Request Has Been Save, Please Wait Confirmation from Owner Service"
            }
          end
        end
      else
        respond_to do |format|
          format.html{
            redirect_to @service, notice: "Your Request can't Save, Please Check Your Request Item"
          }
        end
      end
    else
      redirect_to :back, notice: "Maaf, Anda Masih Memiliki Transaksi yang belum di selesaikan untuk Service ini. Silahkan untuk Melanjutkan atau Membatalkan Transaksi"
    end
  end

  def request_params
    params.require(:request).permit(:request_category_id, :user_id, :service_id, :properties).tap do |whitelisted|
      whitelisted[:properties] = params[:request][:properties]
    end
  end
end