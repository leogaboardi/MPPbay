class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.integer :item_id
      t.float :price

      t.timestamps null: false
    end
  end
end
