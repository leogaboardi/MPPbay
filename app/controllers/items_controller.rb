class ItemsController < ApplicationController

  # TODO: user associaton table
  # TODO: status associaton table
  # TODO: category_1 associaton table
  # TODO: category_2 associaton table
  # TODO: category_3 associaton table
  # TODO: user associaton table
  # TODO: put the CRUD created in "general" controller here
  # TODO: address association sale

  # TODO: think about specific properties for some categories (e.g. color for furniture)

  before_action :check_if_admin #, only[:index, :create, :update]

  def check_if_admin
    if not current_user.admin?
      redirect_to "/"
    end
  end

  def create
    @item = Item.new
    @item.title = params[:title]
    @item.user_id = params[:user_id]
    @item.status_id = params[:status_id]
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

    if @item.save
      redirect_to "/items", :notice => "item created successfully."
    else
      render "new_form"
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to "/items", :notice => "item deleted successfully."
  end

  def edit
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.title = params[:title]
    @item.user_id = params[:user_id]
    @item.status_id = params[:status_id]
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

    if @item.save
      redirect_to "/items", :notice => "item updated successfully."
    else
      render "new_form"
    end
  end
end
