class AddBranchAndCityToWithdraws < ActiveRecord::Migration
  def change
    add_column :withdraws, :branch, :string
    add_column :withdraws, :city, :string
  end
end
