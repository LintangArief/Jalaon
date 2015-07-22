class RenameColumnDistanceFromServices < ActiveRecord::Migration
  def change
    remove_column :services, :distance
  end
end
