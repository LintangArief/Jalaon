class CreateRatePrices < ActiveRecord::Migration
  def change
    create_table :rate_prices do |t|
      t.decimal :Rate

      t.timestamps null: false
    end
  end
end
