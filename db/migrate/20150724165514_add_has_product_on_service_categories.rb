class AddHasProductOnServiceCategories < ActiveRecord::Migration
  def change
    add_column :service_categories, :has_product, :boolean
  end
end
