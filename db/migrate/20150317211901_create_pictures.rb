class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :item_id
      t.attachment :image

      t.timestamps null: false
    end
  end
end
