class AddTypeToServices < ActiveRecord::Migration
  def change
    add_column :services, :properties, :hstore
  end
end
