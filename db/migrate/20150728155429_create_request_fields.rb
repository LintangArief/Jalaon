class CreateRequestFields < ActiveRecord::Migration
  def change
    create_table :request_fields do |t|
      t.string :name
      t.string :field_type
      t.boolean :required
      t.belongs_to :request_category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
