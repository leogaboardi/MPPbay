class CreateConditions < ActiveRecord::Migration
  def change
    create_table :conditions do |t|
      t.string :label
      t.string :description

      t.timestamps null: false
    end
  end
end
