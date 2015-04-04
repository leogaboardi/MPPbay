class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :buyer_id
      t.integer :item_id

      t.timestamps null: false
    end
  end
end
