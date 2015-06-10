class AddVerifyToVerifyUsers < ActiveRecord::Migration
  def change
    add_column :verify_users, :is_verify, :boolean, default: false
  end
end
