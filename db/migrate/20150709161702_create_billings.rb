class CreateBillings < ActiveRecord::Migration
  def change
    create_table :billings do |t|
      t.belongs_to :bank_name, index: true, foreign_key: true
      t.integer :account_number
      t.string :owner

      t.timestamps null: false
    end
  end
end
