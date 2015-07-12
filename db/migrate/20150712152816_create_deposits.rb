class CreateDeposits < ActiveRecord::Migration
  def change
    create_table :deposits do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.decimal :money
      t.integer :status

      t.timestamps null: false
    end
  end
end
