class DeleteRatePriceFromServices < ActiveRecord::Migration
  def change
    remove_column :services, :rate_price_id
  end
end
