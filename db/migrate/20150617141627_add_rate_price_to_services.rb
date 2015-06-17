class AddRatePriceToServices < ActiveRecord::Migration
  def change
    add_column :services, :rate_price, :string
  end
end
