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

  def index
    my_service_ids = current_user.services.map(&:id)
    @current_request = current_user.requests.joins(:confirmation_request).where(confirmation_requests: {status: [1,2,3]})
    @order_request = Request.joins(:confirmation_request).where(confirmation_requests: {status: [1,2,3]}, service_id: my_service_ids)
  end

  def show_order
    @request = current_user.requests.find(params[:id])
  end

  def show_request
    @request = Request.find(params[:id])
  end

  def cancle_request_product
    @request = current_user.requests.find(params[:id])
    if @request.request_products.find(params[:request_product_id]).destroy
      redirect_to :back, notice: "Your Product Request Has Been Cancled"
    else
      redirect_to :back, notice: "Your Product Request Can't Cancled"
    end
  end

  def destroy
    @request = current_user.requests.find(params[:id])
    if @request.destroy
      redirect_to requests_url, notice: "Your Request Has Been Reject"
    else
      redirect_to :back, notice: "Your Request Can't Cancled"
    end
  end

  def confirmation
    @request = Request.find(params[:id])
    if params["ready_ids"].nil?
      if @request.update_attributes(request_params)
        if @request.confirmation_request.update_attributes(status: 2)
          redirect_to requests_path, notice: "Proses Konfirmasi Request Sudah Disimpan"
        else
          redirect_to requests_path, notice: "Proses Konfirmasi Request Tidak Dapat Dilakukan"
        end
      else
          redirect_to requests_path, notice: "Proses Konfirmasi Request Tidak Dapat Dilakukan"
      end
    else
      @count_ids = params["ready_ids"].keys.count
      if @count_ids > 0
        confirmation_product = ConfirmationRequestProduct.where(request_product_id: params["ready_ids"].keys)
        confirmation_product.each do |item, index|
          item.update_attributes(quantity_available: params["quantity"][item.request_product_id.to_s], status: 2)
        end
        @request.confirmation_request.update_attributes(status: 2)
        redirect_to requests_path, notice: "Proses Konfirmasi Request Sudah Disimpan"
      end
    end
  end

  def confirmed_by_user
    @request = current_user.requests.find(params[:id])
    if @request.confirmation_request.update_attributes(status: 3)
      redirect_to requests_path, notice: "Proses Konfirmasi Request Sudah Disimpan"
    else
      redirect_to requests_path, notice: "Proses Konfirmasi Request Tidak Dapat Dolakukan"
    end
  end

  private
    def request_params
      params.require(:request).permit(:request_category_id, :user_id, :service_id, :properties, :confirmation_properties).tap do |whitelisted|
        if params[:request][:properties].nil?
          whitelisted[:confirmation_properties] = params[:request][:confirmation_properties]
        else
          whitelisted[:properties] = params[:request][:properties]
        end
      end
    end
end