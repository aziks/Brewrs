class AddDetailsToBeer < ActiveRecord::Migration
  def change
    add_column :beers, :name, :string
    add_column :beers, :description, :text
  end
end
