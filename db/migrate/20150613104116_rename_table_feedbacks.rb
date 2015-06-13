class RenameTableFeedbacks < ActiveRecord::Migration
  def change
    rename_table :table_feedbacks, :feedbacks
  end
end
