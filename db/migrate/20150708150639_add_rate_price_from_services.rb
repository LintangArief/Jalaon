class AddRatePriceFromServices < ActiveRecord::Migration
  def change
    add_column :services, :rate_price, :integer
  end
end
