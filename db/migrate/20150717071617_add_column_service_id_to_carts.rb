class AddColumnServiceIdToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :service_id, :integer
  end
end
