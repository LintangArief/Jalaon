class RemoveColumnPhoneOnVerifyUsers < ActiveRecord::Migration
  def change
    remove_column :verify_users, :phone_number_confirmed
  end
end
