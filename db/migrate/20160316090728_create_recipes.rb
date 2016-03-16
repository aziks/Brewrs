class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.references :user, index: true
      t.references :beer, index: true
      t.string :title


      t.timestamps null: false
    end
  end
end
