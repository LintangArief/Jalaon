class AddColumnOperatorToRatePrices < ActiveRecord::Migration
  def change
    add_column :rate_prices, :operator, :string
  end
end
