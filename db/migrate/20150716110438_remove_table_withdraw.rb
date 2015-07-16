class RemoveTableWithdraw < ActiveRecord::Migration
  def change
    drop_table :withdraws
  end
end
