class CreateColumnRatePriceFromServices < ActiveRecord::Migration
  def change
    add_column :services, :rate_price_id, :integer, :default => 1
  end
end
