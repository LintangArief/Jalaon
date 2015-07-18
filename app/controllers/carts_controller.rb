class CartsController < ApplicationController
  before_action :setting_cart, only: [:add_cart]
  before_action :set_cart, only: [:destroy]
  def index
    @carts = current_user.carts
  end
  
  def add_cart
    @product = ProductService.find(params[:product_id])
    @cart.add(@product, @product.price)
    redirect_to :back, notice: "Your Order Has Been Save to Transaction, Please Go to Current Transaction"
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