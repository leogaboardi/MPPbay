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
    redirect_to "/summary", :notice => "Item deleted."
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
    @prices = Price.where(:item_id => @item.id)
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

def frontend_create
    @item = Item.new
    @item.user_id = params[:user_id]
    @item.title = params[:title]
    @item.category_1_id = params[:category_1_id]
    @item.description = params[:description]
    @item.condition_id = params[:condition_id]
    @item.item_url = params[:item_url]
    @item.details = params[:details]
    @item.status_id = 1 #A new item is always created as a draft

    @item.handling_time = params[:handling_time]
    @item.available_at = params[:available_at]

    @item.listing_duration = params[:listing_duration]
    @item.address_id = params[:address_id]

    if @item.save
      @price = Price.new
      @price.value = params[:price]
      @price.item_id = @item.id

      if @price.save
        #if false
        #  @picture = Picture.new
        #  @picture.item_id = @item.id
        #  @picture.image = params[:item][:image]
        #  @picture.default_picture = true

       #   if @picture.save
       #     redirect_to "/sell", :notice => "Item created successfully."
       #   else
       #     render "item_new"
       #   end
       # else

          redirect_to "/item_display/"+@item.id.to_s, :notice => "Item created successfully."
       # end
      else
        render "item_new"
      end
    else
      render "item_new"
    end
  end
  def frontend_item_update
    @item = Item.find(params[:id])
    @item.user_id = params[:user_id]
    @item.title = params[:title]
    @item.category_1_id = params[:category_1_id]
    @item.description = params[:description]
    @item.condition_id = params[:condition_id]
    @item.item_url = params[:item_url]
    @item.details = params[:details]
    @item.status_id = params[:status_id]
    @item.handling_time = params[:handling_time]
    @item.available_at = params[:available_at]
    @item.listing_duration = params[:listing_duration]
    @item.address_id = params[:address_id]

    if @item.save
      @price = Price.new
      @price.value = params[:price]
      @price.item_id = @item.id

      if @price.save
#        if false
          #@picture = Picture.new
          #@picture.item_id = @item.id
          #@picture.image = params[:item][:image]
          #@picture.default_picture = true

 #         if @picture.save
 #           redirect_to "/sell", :notice => "Item created successfully."
 #         else
 #           render "item_new"
 #         end
 #       else

          redirect_to "/item_display/"+@item.id.to_s, :notice => "Item created successfully."
        #end
      else
        render "item_edit"
      end
    else
      render "item_edit"
    end
  end

  def frontend_item_edit
    @item = Item.find(params[:id])
    @price = Price.where(:item_id => params[:id]).last
    @address = Address.where(:user => current_user.id)
    render("frontend_edit")
  end

  def frontend_show
    # TODO: P0: clickable heart (creates a favorite)
    # TODO: P0: item page is static, make it dynamic
    @pictures = Picture.where(:item_id => params[:id])
    @price = Price.where(:item_id => params[:id]).last
    @item = Item.find(params[:id])
  end

  def frontend_new
    @item = Item.new
    @price = Price.new
    @address = Address.where(:user => current_user.id)
  end
end
