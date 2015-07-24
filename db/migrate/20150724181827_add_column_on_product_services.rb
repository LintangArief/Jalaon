class AddColumnOnProductServices < ActiveRecord::Migration
  def change
    add_column :product_services, :takeaway, :boolean
    add_column :product_services, :delivery, :boolean
  end
end
