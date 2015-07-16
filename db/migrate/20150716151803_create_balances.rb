class CreateBalances < ActiveRecord::Migration
  def change
    create_table :balances do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.decimal :money

      t.timestamps null: false
    end
  end
end
