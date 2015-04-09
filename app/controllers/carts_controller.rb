class CartsController < ApplicationController

  # TODO: check the check_if_admin functions
  # TODO: uniqueness when creating a cart (no user can have twice the same item)
  # FIXME: my_index: @sellers is selecting only the seller name. I want the ID as well
  # FIXME: my_index: the if statment in view compares seller name. Should be seller ID
  before_action :check_if_admin, only: [:index]

  def check_if_admin
    if not current_user.admin?
      redirect_to "/"
    end
  end

  def create
    @cart = Cart.new
    @cart.user_id = params[:user_id]
    @cart.item_id = params[:item_id]

    if @cart.save
      redirect_to "/my_cart", :notice => "Item added to cart."
    else
      render "new_form"
    end
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to "/my_cart", :notice => "Item successfully removed from cart."
  end

  def edit
    @cart = Cart.find(params[:id])
  end

  def my_index
    @carts = Cart.where(:user_id => current_user.id).joins(item: :user).order("users.name ASC")
    @sellers = Cart.where(:user_id => current_user.id).joins(item: :user).select(:name).distinct

    @pictures = Picture.all
    @prices = Price.all
  end

  def index
    @carts = Cart.all
  end

  def new
    @cart = Cart.new
  end

  def show
    @cart = Cart.find(params[:id])
  end

  def update
    @cart = Cart.find(params[:id])
    @cart.user_id = params[:user_id]
    @cart.item_id = params[:item_id]

    if @cart.save
      redirect_to "/carts", :notice => "Cart item successfully updated."
    else
      render "new_form"
    end
  end
end
