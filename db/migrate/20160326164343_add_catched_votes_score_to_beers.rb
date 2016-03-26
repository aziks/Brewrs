class AddCatchedVotesScoreToBeers < ActiveRecord::Migration
  def self.up
    add_column :beers, :cached_votes_score, :integer, :default => 0

  end
  def self.down
    remove_column :beers, :cached_votes_score

  end
end
