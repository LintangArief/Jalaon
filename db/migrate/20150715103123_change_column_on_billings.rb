class ChangeColumnOnBillings < ActiveRecord::Migration
  def change
    rename_column :billings, :account_number, :string
  end
end
