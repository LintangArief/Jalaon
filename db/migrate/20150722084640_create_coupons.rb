class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :token
      t.decimal :money
      t.datetime :start_at
      t.datetime :end_at
      t.integer :limit_user

      t.timestamps null: false
    end
  end
end
