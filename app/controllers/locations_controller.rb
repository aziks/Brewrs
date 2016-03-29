require 'pry'
class LocationsController < ApplicationController

before_action :authenticate_user!


  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
  end

  # GET /locations/new
  def new
    @beer = Beer.find(params[:beer_id])

    @location = Location.new

    @locations = @beer.locations
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations
  # POST /locations.json

  def create
    @beer = Beer.find(params[:beer_id])
    @location = @beer.locations.new(location_params)
      if @location.save
        redirect_to new_location_path(@beer), notice: 'New location added'
      else
        redirect_to new_location_path(@beer), notice: 'ERROR'
      end

  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:beer_id, :address, :lat, :long)

    end
end
