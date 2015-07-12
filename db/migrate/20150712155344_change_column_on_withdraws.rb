class ChangeColumnOnWithdraws < ActiveRecord::Migration
  def change
    change_column :withdraws, :status, :integer, default: 1
  end
end
