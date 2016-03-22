class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.references :beer, index: true
      t.string :adress
      t.string :lat
      t.string :long

      t.timestamps null: false
    end
  end
end
