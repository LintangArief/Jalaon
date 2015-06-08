class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.text :description
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :product_service, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
