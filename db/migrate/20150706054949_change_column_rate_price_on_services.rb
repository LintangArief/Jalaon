class ChangeColumnRatePriceOnServices < ActiveRecord::Migration
  def change
    remove_column :services, :rate_price
    add_column :services, :rate_price,  :decimal
  end
end
