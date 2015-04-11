class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :buyer_id
      t.integer :item_id

      t.timestamps null: false
    end
  end
end
