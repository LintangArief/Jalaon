class CreateRequestProducts < ActiveRecord::Migration
  def change
    create_table :request_products do |t|
      t.belongs_to :request, index: true, foreign_key: true
      t.belongs_to :product_service, index: true, foreign_key: true
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
