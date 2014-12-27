class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :buyer_id
      t.integer :seller_id
      t.integer :item_id

      t.timestamps null: false
    end
  end
end
