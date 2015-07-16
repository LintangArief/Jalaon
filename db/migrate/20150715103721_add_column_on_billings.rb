class AddColumnOnBillings < ActiveRecord::Migration
  def change
    add_column :billings, :account_number, :string
  end
end
