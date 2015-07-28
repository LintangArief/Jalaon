class CreateRequestCategories < ActiveRecord::Migration
  def change
    create_table :request_categories do |t|
      t.belongs_to :service_category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
