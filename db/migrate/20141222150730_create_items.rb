class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :user_id
      t.integer :status_id
      t.string :title
      t.integer :condition_id
      t.string :description
      t.string :details
      t.string :handling_time
      t.date :listing_duration
      t.date :available_at
      t.string :item_url
      t.integer :address_id
      t.integer :category_1_id
      t.integer :category_2_id
      t.integer :category_3_id

      t.timestamps null: false
    end
  end
end
