class CreateFotoProductServices < ActiveRecord::Migration
  def change
    create_table :foto_product_services do |t|
      t.belongs_to :product_service, index: true, foreign_key: true
      t.string :avatar

      t.timestamps null: false
    end
  end
end