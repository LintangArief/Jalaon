class CreateServices < ActiveRecord::Migration
  def self.up
    create_table :services do |t|
      t.belongs_to :user
      t.belongs_to :service_category
      t.string :title
      t.text :description
      t.string :avatar
    end
  end

  def self.down
    drop_table :services
  end
end