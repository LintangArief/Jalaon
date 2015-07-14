class CreateConfirmationDeposits < ActiveRecord::Migration
  def change
    create_table :confirmation_deposits do |t|
      t.belongs_to :deposit, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :bank_name, index: true, foreign_key: true
      t.datetime :date_transfer
      t.string :no_credit
      t.string :name_owner_credit
      t.decimal :money
      t.string :attach
      t.timestamps null: false
    end
  end
end
