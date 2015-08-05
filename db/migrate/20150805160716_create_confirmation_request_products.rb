class CreateConfirmationRequestProducts < ActiveRecord::Migration
  def change
    create_table :confirmation_request_products do |t|
      t.belongs_to :request_product, index: true, foreign_key: true
      t.integer :quantity_available
      t.integer :status

      t.timestamps null: false
    end
  end
end
