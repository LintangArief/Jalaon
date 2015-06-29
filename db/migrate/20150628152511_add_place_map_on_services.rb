class AddPlaceMapOnServices < ActiveRecord::Migration
  def change
    add_column :services, :full_street_address, :string
    add_column :services, :latitude, :float
    add_column :services, :longitude, :float
  end
end
