class AddTrashToDeposits < ActiveRecord::Migration
  def change
    add_column :deposits, :trash, :boolean, default:false
  end
end
