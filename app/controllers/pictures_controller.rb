class PicturesController < ApplicationController

  before_action :authenticate_user!
  before_action :check_if_admin

  def check_if_admin
    if not current_user.admin?
      redirect_to "/"
    end
  end

  def create

    @picture = Picture.new
    @picture.item_id = params[:picture][:item_id]
    @picture.image = params[:picture][:image]

    if @picture.save
      redirect_to "/pictures", :notice => "Picture created successfully."
    else
      render "new"
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to "/pictures", :notice => "Picture deleted successfully."
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    @picture.item_id = params[:picture][:item_id]

    if @picture.save
      redirect_to "/pictures", :notice => "Picture updated successfully."
    else
      render "new"
    end
  end
end
