class AddUserIdToBilling < ActiveRecord::Migration
  def change
    add_column :billings, :user_id, :integer, null:false
  end
end
