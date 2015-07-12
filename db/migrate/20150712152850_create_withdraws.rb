class CreateWithdraws < ActiveRecord::Migration
  def change
    create_table :withdraws do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.decimal :money
      t.integer :status

      t.timestamps null: false
    end
  end
end
