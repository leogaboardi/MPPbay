class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.string :name
      t.string :email_filter

      t.timestamps null: false
    end
  end
end
