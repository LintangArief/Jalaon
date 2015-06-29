class RenameColumnFormatAdressInServices < ActiveRecord::Migration
  def change
    rename_column :services, :full_street_address, :address
  end
end
