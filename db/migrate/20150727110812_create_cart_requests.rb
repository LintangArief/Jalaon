class CreateCartRequests < ActiveRecord::Migration
  def change
    create_table :cart_requests do |t|
      t.belongs_to :cart, index: true, foreign_key: true
      t.integer :status, default: 1

      t.timestamps null: false
    end
  end
end
