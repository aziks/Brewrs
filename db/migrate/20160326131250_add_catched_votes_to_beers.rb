class AddCatchedVotesToBeers < ActiveRecord::Migration
  def self.up
    add_column :beers, :cached_votes_total, :integer, :default => 0

  end
  def self.down
    remove_column :beers, :cached_votes_total

  end
end
