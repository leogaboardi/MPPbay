class GeneralController < ApplicationController

  # TODO: P0: item_new: validation (both in model and in view)
  # TODO: P0: css: items in browse with 2 line titles are off the frame
  # TODO: P0: item: take out the "handling time" description
  # TODO: P1: item_new: make photos uploadable in
  # TODO: P1: summary: make a checklist check when click "put on sale"
  # TODO: P1: summary: put a tab for "items you offered to buy"
  # TODO: P1: item: make "add cart" button unavailable if already in cart/offer
  # TODO: P2: item: put a sign telling "someone is already asking for this item"

  # FIXME: P0: category dropdown in item / edit page
  # FIXME: P0: summary: address is duplicated in main and "other addresses"

  before_action :authenticate_user!

  def buy
    # TODO: P0: clickable heart (creates a favorite)
    # TODO: P0: browser is static, make it dynamic
    # TODO: P1: put pagination, if needed

    @items = Item.where(:status => 2)
    @pictures = Picture.all


    render "browse"
  end

  def disable
    @item = Item.find(params[:id])
    @item.status_id = 4
    @item.save

    redirect_to "/summary", :notice => "Your item is now disabled and taken out of sale!"
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

    @other_addresses = Address.where(:user_id => current_user.id, :main => [false,nil])
    @main_addresses = Address.where(:user_id => current_user.id, :main => [true])

    @favorites = Favorite.all
    @pictures = Picture.all
    @selling = Item.where(:user_id => current_user.id, :status_id => 2)
    @draft = Item.where(:user_id => current_user.id, :status_id => 1)
    @sold = Item.where(:user_id => current_user.id, :status_id => 3)
    @offers_made = Offer.where(:buyer_id => current_user.id)
    @disabled = Item.where(:user_id => current_user.id, :status_id => 4)
    @purchases = Purchase.where(:buyer_id => current_user.id)
  end
end
