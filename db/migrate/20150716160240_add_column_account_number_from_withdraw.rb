class AddColumnAccountNumberFromWithdraw < ActiveRecord::Migration
  def change
    add_column :withdraws, :account_number, :string
  end
end
