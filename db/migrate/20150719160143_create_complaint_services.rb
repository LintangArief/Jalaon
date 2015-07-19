class CreateComplaintServices < ActiveRecord::Migration
  def change
    create_table :complaint_services do |t|
      t.string :name
      t.string :email
      t.belongs_to :service, index: true, foreign_key: true
      t.text :description

      t.timestamps null: false
    end
  end
end
