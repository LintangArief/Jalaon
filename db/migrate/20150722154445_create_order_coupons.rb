class CreateOrderCoupons < ActiveRecord::Migration
  def change
    create_table :order_coupons do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :coupon, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
