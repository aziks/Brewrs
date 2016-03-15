class BeersController < ApplicationController

  # GET /beers
  # GET /beers.json
  def index
    @user = User.find(params[:user_id])
    @beers = @user.beers.all
  end

  # GET /beers/1
  # GET /beers/1.json
  def show
    @beer = Beer.find(params[:id])
    @user = User.find(params[:user_id])
  end

  # GET /beers/new
  def new
    @user = current_user
    @beer = Beer.new
  end

  # GET /beers/1/edit
  def edit
    @user = current_user
    @beer = Beer.find(params[:id])
  end

  # POST /beers
  # POST /beers.json
  def create
    @user = current_user
    @beer = @user.beers.new(beer_params)

      if @beer.save
        redirect_to user_beers_path, notice: 'Beer was successfully created!' 
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
        redirect_to user_beers_path, notice: 'Beer was successfully updated!'  
      else
        render 'edit'  
      end
    
  end

  # DELETE /beers/1
  # DELETE /beers/1.json
  def destroy
    @user = User.find(params[:user_id])
    @beer = @user.beers.find(params[:id])

    @beer.destroy
 
    redirect_to user_beers_path, notice: 'Beer was successfully destroyed.' 
      
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_beer
    #   @beer = Beer.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def beer_params
     
      params.require(:beer).permit(:name, :description)

    end
end
