class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.integer :user_id, null: false
      t.integer :service_category_id, null: false
      
      t.string :title, null: false
      t.text :description, null: false
      t.string :avatar
      t.integer :count_follow, default: 0
      t.timestamps
    end
  end
end
