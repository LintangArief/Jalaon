class AddColumnMoneyFromBalances < ActiveRecord::Migration
  def change
    add_column :balances, :money, :decimal, default: 0
  end
end
