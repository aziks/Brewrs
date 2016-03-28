class SiteController < ApplicationController

  def home
    @last_added_beers = Beer.last_added
    @last_brewers = User.last_added
    @best_beers = Beer.best_beers
  end

  def index_beers
    @beers = Beer.all.sort_by {rand} [0..19]   
  end

  def index_recipes
    @recipes = Recipe.all.sort_by {rand} [0..19]   
  end

end
