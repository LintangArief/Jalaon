class AddColumnRateFromRatePrices < ActiveRecord::Migration
  def change
    add_column :rate_prices, :rate, :decimal
  end
end
