class CreateWithdraws < ActiveRecord::Migration
  def change
    create_table :withdraws do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.decimal :money
      t.belongs_to :billing, index: true, foreign_key: true
      t.belongs_to :bank_name, index: true, foreign_key: true
      t.string :account_number
      t.string :account_name
      t.boolean :has_billing, default:false
      t.boolean :status, default:false

      t.timestamps null: false
    end
  end
end
