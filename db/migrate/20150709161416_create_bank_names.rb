class CreateBankNames < ActiveRecord::Migration
  def change
    create_table :bank_names do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
