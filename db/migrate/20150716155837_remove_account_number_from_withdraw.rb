class RemoveAccountNumberFromWithdraw < ActiveRecord::Migration
  def change
    remove_column :withdraws, :account_number
  end
end
