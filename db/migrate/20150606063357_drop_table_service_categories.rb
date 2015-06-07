class DropTableServiceCategories < ActiveRecord::Migration
  def change
    drop_table :service_categories
  end
end
