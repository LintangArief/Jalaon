class DropTableFeedback < ActiveRecord::Migration
  def change
    drop_table :feedbacks
  end
end
