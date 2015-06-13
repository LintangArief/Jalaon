class CreateTableFeedbacks < ActiveRecord::Migration
  def change
    create_table :table_feedbacks do |t|
      t.text :description
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :service, index: true, foreign_key: true
    end
  end
end
