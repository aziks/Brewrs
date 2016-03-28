class UsersController < ApplicationController
  
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @user = User.new
  end  

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to 'profile_path'
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @recipe = @user.recipes
    @beer = @user.beers
  end

  def index
    @users = User.all.sort_by {rand} [0..19]   
    
  end

  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to action: 'index'
    else
      render 'edit'
    end

  end

  def profile
    @user = current_user
    @recipe = @user.recipes
    @beer = @user.beers
  end

private

  # def user
  #   @_user ||= User.find(params[:user_id])
  # end

  def user_params
    params.require(:user).permit(:name, :email, :avatar)
  end


end