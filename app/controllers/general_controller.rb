class GeneralController < ApplicationController

  # TODO: P0: item_new: tooltips
  # TODO: P0: item_new: validation (both in model and in view)
  # TODO: P1: item_new: make photos uploadable in
  # TODO: P1: summary: make a checklist check when click "put on sale"
  # FIXME: P0: category dropdown in item / edit page

  before_action :authenticate_user!

  def buy
    # TODO: P0: clickable heart (creates a favorite)
    # TODO: P0: browser is static, make it dynamic
    # TODO: P1: put pagination, if needed

    @prices = Price.all
    @items = Item.where(:status => 2)
    @pictures = Picture.all
    render "browse"
  end

  def create
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

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to "/summary", :notice => "Item deleted successfully."
  end

  def disable
    @item = Item.find(params[:id])
    @item.status_id = 4
    @item.save

    redirect_to "/summary", :notice => "Your item is now disabled and taken out of sale!"
  end

  def edit
    @item = Item.find(params[:id])
    @price = Price.where(:item_id => params[:id]).last
    render("item_edit")
  end

  def item
    # TODO: P0: clickable heart (creates a favorite)
    # TODO: P0: item page is static, make it dynamic
    @pictures = Picture.where(:item_id => params[:id])
    @price = Price.where(:item_id => params[:id]).last
    @item = Item.find(params[:id])
  end

  def item_new
    @item = Item.new
    @price = Price.new
    @picture = Picture.new
    @condition = Condition.all
  end

  def put_on_sale
    @item = Item.find(params[:id])
    @item.status_id = 2
    @item.save

    redirect_to "/sell", :notice => "Your item is now on sale!"
  end

  def sell
    # TODO: P0: dynamic features
    # message if no item to sell is in there
    # sell item button
    # take out the hearts

    @sell=true

    @prices = Price.all
    @pictures = Picture.all
    @items = Item.where(:status => 2, :user_id => current_user.id)
    render "browse"
  end


  def summary
    # TODO: P0: create dynamic page for "bought" tab
    # TODO: P0: on "sale" tab, separate the items that require activation
    # TODO: P0: on "sale" tab, make edit / delete / activate buttons work
    # TODO: P0: on "sale" tab, make edit / delete / activate buttons work

    # TODO: P0: on "profile" tab, make address edit / delete buttons work


    @prices = Price.all
    @other_addresses = Address.where(:user_id => current_user.id, :main => [false,nil])
    @main_addresses = Address.where(:user_id => current_user.id, :main => [true])

    @favorites = Favorite.all
    @pictures = Picture.all
    @selling = Item.where(:user_id => current_user.id, :status_id => 2)
    @draft = Item.where(:user_id => current_user.id, :status_id => 1)
    @sold = Item.where(:user_id => current_user.id, :status_id => 3)
    @disabled = Item.where(:user_id => current_user.id, :status_id => 4)
    @purchases = Purchase.where(:buyer_id => current_user.id)
  end

  def update
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
end
