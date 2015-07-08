class RemoveColumnRateFromRatePrices < ActiveRecord::Migration
  def change
    remove_column :rate_prices, :Rate
  end
end
