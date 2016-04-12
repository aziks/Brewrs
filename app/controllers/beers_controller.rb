require 'pry'
class BeersController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]


  def index
    @user = User.find(params[:user_id])
    @beers = @user.beers.all
  end

  def upvote
    @beer = Beer.find(params[:id])
    @beer.upvote_by current_user
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { render json: @beer }
    end
  end

  def downvote
    @beer = Beer.find(params[:id])
    @beer.downvote_by current_user
    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render layout: false }
    end
  end

  def show
    @beer = Beer.find(params[:id])
    @recipe = @beer.recipe
    @locations = @beer.locations
    @score_beer = @beer.score
  end

  def add_new_comment
    params[:comment][:user_id] = params[:user_id]
    @beer = Beer.find(params[:id])
    @beer.comments << Comment.new(comment_params)
    @beer.user_id = current_user
    redirect_to :action => :show, :id => @beer.id
  end

 # GET /beers/new
  def new
    @user = current_user
    @beer = Beer.new
    @recipe = Recipe.find(params[:recipe_id])
  end

  # GET /beers/1/edit
  def edit
    @user = current_user
    @recipe = Recipe.find(params[:id])
    @beer = Beer.find(params[:id])
  end

  # POST /beers
  # POST /beers.json
  def create
    @user = current_user
    @beer = @user.beers.new(beer_params)
    
    @recipe = Recipe.find(params[:recipe_id])

      if @beer.save
        @recipe.beer = @beer

        redirect_to user_beers_path(@user), notice: 'Beer was successfully created!' 
      else
        render 'new'  
      end
    
  end
  # PATCH/PUT /beers/1
  # PATCH/PUT /beers/1.json
  def update
    @user = User.find(params[:user_id])
    @beer = @user.beers.find(params[:id])

      if @beer.update_attributes(beer_params)
        redirect_to user_recipe_beers_path, notice: 'Beer was successfully updated!'  
      else
        render 'edit'  
      end
    
  end

  # DELETE /beers/1
  # DELETE /beers/1.json
  def destroy
    @user = current_user
    @beer = @user.beers.find(params[:id])

    @beer.destroy
 
    redirect_to user_beers_path(current_user.id), notice: 'Beer was successfully destroyed.' 
      
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_beer
    #   @beer = Beer.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def beer_params
      params.require(:beer).permit(:name, :description, :beer_image)
    end

    def comment_params
      params.require(:comment).permit(:user_id, :comment)
    end
  
end
