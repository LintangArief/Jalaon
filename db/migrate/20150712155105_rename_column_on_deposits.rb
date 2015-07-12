class RenameColumnOnDeposits < ActiveRecord::Migration
  def change
    change_column :deposits, :status, :integer, default: 1
  end
end
