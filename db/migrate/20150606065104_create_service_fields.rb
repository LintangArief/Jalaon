class CreateServiceFields < ActiveRecord::Migration
  def change
    create_table :service_fields do |t|
      t.string :name
      t.string :field_type
      t.boolean :required
      t.belongs_to :service_category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
