class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :label
      t.string :address_line_1
      t.string :city
      t.string :state
      t.integer :zip
      t.string :country

      t.timestamps null: false
    end
  end
end
