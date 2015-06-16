class AddPriceToProductServices < ActiveRecord::Migration
  def change
    add_column :product_services, :price, :integer, default: 0
  end
end