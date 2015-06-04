class ItemsController < ApplicationController

  # TODO: think about specific properties for some categories (e.g. color for furniture)
  # FIXME: leave the address dropdown blank if there are no address for this user

  before_action :authenticate_user!

  before_action :check_if_admin, only: [:index]
  before_action :check_current_user, only: [ :edit]

  def check_if_admin
    if not current_user.admin?
      redirect_to "/"
    end
  end

  def check_current_user
    @item = Item.find(params[:id])
    if not current_user.id == @item.user_id || current_user.admin?
      redirect_to "/"
    end
  end

  def create
    @item = Item.new
    @item.title = params[:title]
    @item.user_id = params[:user_id]
    @item.condition_id = params[:condition_id]
    @item.details = params[:details]
    @item.description = params[:description]
    @item.handling_time = params[:handling_time]
    @item.listing_duration = params[:listing_duration]
    @item.available_at = params[:available_at]
    @item.item_url = params[:item_url]
    @item.address_id = params[:address_id]
    @item.price = params[:price]
    @item.category_1_id = params[:category_1_id]
    @item.category_2_id = params[:category_2_id]
    @item.category_3_id = params[:category_3_id]

    if params[:status] == "true"
      @item.status_id = 2 #Put on sale
    else
      @item.status_id = 1 #Put in draft
    end

    if @item.save
      @picture = Picture.new
      @picture.item_id = @item.id
      @picture.image = params[:item][:image]
      @picture.default_picture = true

      if @picture.save
      redirect_to item_path(@item.id), :notice => "Item created!"
      else
        @address = Address.where(:user => current_user.id)
      render :new
      end
    else
      @address = Address.where(:user => current_user.id)
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if current_user.admin? || @item.user_id == current_user.id
      @item.destroy
    end
    redirect_to summary_path, :notice => "Item deleted."
  end

  def edit
    @item = Item.find(params[:id])
    @address = Address.where(:user => current_user.id)
  end

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @address = Address.where(:user => current_user.id)
  end

  def show
    # TODO: P0: clickable heart (creates a favorite)
    # TODO: P0: item page is static, make it dynamic
    @pictures = Picture.where(:item_id => params[:id])

    if @pictures.where(:default_picture => true).count == 0
      @main_picture = @pictures.first
    else
      @main_picture = @pictures.where(:default_picture => true).first
    end
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.title = params[:title]
    if current_user.admin?
      @item.user_id = params[:user_id]
    else
      @item.user_id = current_user.id
    end
    @item.condition_id = params[:condition_id]
    @item.details = params[:details]
    @item.description = params[:description]
    @item.handling_time = params[:handling_time]
    @item.listing_duration = params[:listing_duration]
    @item.available_at = params[:available_at]
    @item.item_url = params[:item_url]
    @item.address_id = params[:address_id]
    @item.category_1_id = params[:category_1_id]
    @item.category_2_id = params[:category_2_id]
    @item.category_3_id = params[:category_3_id]
    @item.price = params[:price]
    @item.status_id = params[:status_id]

    if @item.save
      redirect_to item_path(@item.id), :notice => "Item updated!."
    else
      @address = Address.where(:user => current_user.id)
      render :edit
    end
  end
end
