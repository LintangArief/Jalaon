class DeleteRatePriceFromServices < ActiveRecord::Migration
  def change
    drop_table :rate_prices
    remove_column :services, :rate_price_id
  end
end
