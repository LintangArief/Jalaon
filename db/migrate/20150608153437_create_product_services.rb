class CreateProductServices < ActiveRecord::Migration
  def change
    create_table :product_services do |t|
      t.string :title
      t.text :description
      t.belongs_to :service, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
