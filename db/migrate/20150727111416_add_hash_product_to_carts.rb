class AddHashProductToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :has_product, :boolean, default: false
  end
end
