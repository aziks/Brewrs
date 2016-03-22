class RecipesController < ApplicationController

before_action :authenticate_user!, except: [:show]


  def index
    @user = User.find(params[:user_id])
    @recipes = @user.recipes.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    if @recipe.beer != nil
      @beer = @recipe.beer
    end
    @user = User.find(@recipe.user_id)
  end

  def new
    @user = current_user
    @recipe = Recipe.new
  end

  def edit
    @user = current_user
    @recipe = Recipe.find(params[:id])
  end

  def create
    @user = current_user
    @recipe = @user.recipes.new(recipe_params)

      if @recipe.save
        redirect_to user_recipes_path, notice: 'Recipe was successfully created!' 
      else
        render 'new', notice: 'Sorry something was wrong...' 
      end
  end

  def update
    @user = User.find(params[:user_id])
    @recipe = @user.recipes.find(params[:id])

      if @recipe.update_attributes(recipe_params)
        redirect_to user_recipe_path, notice: 'Recipe was successfully updated!'  
      else
        render 'edit', notice: 'Sorry something was wrong...'
      end
    
  end

  def destroy
    @user = current_user
    @recipe = @user.recipes.find(params[:id])

    @recipe.destroy
 
    redirect_to user_recipes_path(current_user.id), notice: 'Recipe was successfully destroyed.' 
      
  end

private

    def recipe_params     
      params.require(:recipe).permit(:title)
    end

end
