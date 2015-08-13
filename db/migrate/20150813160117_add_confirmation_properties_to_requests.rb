class AddConfirmationPropertiesToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :confirmation_properties, :hstore
    execute "CREATE INDEX requests_confirmation_properties ON requests USING GIN(confirmation_properties)"
  end
end
