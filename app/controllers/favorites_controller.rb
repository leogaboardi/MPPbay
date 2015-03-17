class FavoritesController < ApplicationController

  # TODO: user association
  # TODO: item association

  before_action :check_if_admin

  def check_if_admin
    if not current_user.admin?
      redirect_to "/"
    end
  end

  def create
    @favorite = Favorite.new
    @favorite.user_id = params[:user_id]
    @favorite.item_id = params[:item_id]

    if @favorite.save
      redirect_to "/favorites", :notice => "favorite created successfully."
    else
      render "new_form"
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to "/favorites", :notice => "favorite deleted successfully."
  end

  def edit
    @favorite = Favorite.find(params[:id])
  end

  def index
    @favorites = Favorite.all
  end

  def new
    @favorite = Favorite.new
  end

  def show
    @favorite = Favorite.find(params[:id])
  end

  def update
    @favorite = Favorite.find(params[:id])
    @favorite.user_id = params[:user_id]
    @favorite.item_id = params[:item_id]

    if @favorite.save
      redirect_to "/favorites", :notice => "favorite updated successfully."
    else
      render "new_form"
    end
  end
end
