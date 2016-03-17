class RecipesController < ApplicationController

before_action :authenticate_user!, except: [:index, :show]


  def index
    @user = User.find(params[:user_id])
    @recipes = @user.recipes.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def new
    @user = current_user
    @recipe = Recipe.new
  end

  def create
    @user = current_user
    @recipe = @user.recipes.new(recipe_params)

      if @recipe.save
        redirect_to user_recipes_path, notice: 'Recipe was successfully created!' 
      else
        render 'new'  
      end
  end

private

    def recipe_params     
      params.require(:recipe).permit(:title)
    end

end
