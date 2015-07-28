class AddIndexToPropertiesRequests < ActiveRecord::Migration
  def up
    add_column :requests, :properties, :hstore
    execute "CREATE INDEX requests_properties ON requests USING GIN(properties)"
  end

  def down
    execute "DROP INDEX requests_properties"
  end
end
