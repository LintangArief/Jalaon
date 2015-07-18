class RemoveColumnOnBalance < ActiveRecord::Migration
  def change
    remove_column :balances, :branch
    remove_column :balances, :city
    add_column :billings, :branch, :string
    add_column :billings, :city, :string
  end
end
