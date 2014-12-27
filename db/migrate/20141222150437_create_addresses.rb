class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :full_name
      t.string :address_line_1
      t.string :address_line_2
      t.integer :building_id
      t.string :city
      t.string :state
      t.integer :zip
      t.string :country
      t.integer :phone_number

      t.timestamps null: false
    end
  end
end
