class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.references :user, index: true
      t.references :recipe, index: true

      t.timestamps null: false
    end
  end
end
