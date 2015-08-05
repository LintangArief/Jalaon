class CreateConfirmationRequests < ActiveRecord::Migration
  def change
    create_table :confirmation_requests do |t|
      t.belongs_to :request, index: true, foreign_key: true
      t.decimal :delivery_fee
      t.integer :status
      t.timestamps null: false
    end
  end
end
