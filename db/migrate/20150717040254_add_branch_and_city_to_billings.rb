class AddBranchAndCityToBillings < ActiveRecord::Migration
  def change
    add_column :balances, :branch, :string
    add_column :balances, :city, :string
  end
end
