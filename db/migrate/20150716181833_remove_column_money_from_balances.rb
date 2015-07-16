class RemoveColumnMoneyFromBalances < ActiveRecord::Migration
  def change
    remove_column :balances, :money
  end
end
