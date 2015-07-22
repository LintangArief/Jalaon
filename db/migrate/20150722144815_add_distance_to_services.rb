class AddDistanceToServices < ActiveRecord::Migration
  def change
    add_column :services, :distance, :integer, default: 5
  end
end
