class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def new
    @user = User.new
  end  

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to 'user_index_path'
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
    
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
    render 'users/profile'
  end

private

  # def user
  #   @_user ||= User.find(params[:user_id])
  # end

  def user_params
    params.require(:user).permit(:name, :email)
  end


end