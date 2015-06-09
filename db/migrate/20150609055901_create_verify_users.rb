class CreateVerifyUsers < ActiveRecord::Migration
  def change
    create_table :verify_users do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :foto_ktp
      t.string :phone_number_confirmed

      t.timestamps null: false
    end
  end
end
