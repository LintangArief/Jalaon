class CartsController < ApplicationController
  before_action :setting_cart, only: [:add_cart]
  before_action :set_cart, only: [:destroy]
  def index
    @carts = current_user.carts.where(status: 4)
  end
  
  def add_cart
    if params[:has_product] == "true"
      count_order_product = params[:product_ids].count
      (0...count_order_product).each {|i|
        @product = ProductService.find(params[:product_ids][i])  
        @cart.add(@product, @product.price, params[:product_quantity_ids][i].to_i)
      }
      @cart.update_attributes(has_product: true)
    else
      @service = Service.find(params[:id])
      @cart.add(@service, 0)
      @cart.update_attributes(has_product: false)
      nil
    end
    redirect_to :back, notice: "Your Order Has Been Save to Transaction, Please Go to Current Transaction"
  end

  def request_order
    @myservices = current_user.services.map(&:id)
    @request = Cart.where(status: 1, service_id: current_user.services.map(&:id)) 
    @my_request = current_user.carts.where("status = 1")
  end

  def destroy
    if @cart.user_id == current_user.id
      @cart.destroy
      redirect_to :back, notice: "Your Order Product Has Been Delete to Transaction"
    end
  end

  private
    def setting_cart
      if current_user
        @cart = nil
        check_cart = current_user.carts.find_by(service_id: params[:id])
        if check_cart.nil?
          @cart = current_user.carts.create(service_id: params[:id])
        else
          @cart = check_cart
        end
      end
    end

    def set_cart
      @cart = Cart.find(params[:id])
    end
end