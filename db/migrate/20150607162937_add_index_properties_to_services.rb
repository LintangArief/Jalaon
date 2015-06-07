class AddIndexPropertiesToServices < ActiveRecord::Migration
def up
  execute "CREATE INDEX services_properties ON services USING GIN(properties)"
end

def down
  execute "DROP INDEX services_properties"
end
end
