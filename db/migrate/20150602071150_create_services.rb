class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.integer :user_id
      t.integer :service_category_id
      t.string :title
      t.text :description
      t.string :avatar

      t.timestamps
    end
  end
end
