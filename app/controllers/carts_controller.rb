class CartsController < ApplicationController

  # TODO: check the check_if_admin functions
  before_action :authenticate_user!
  before_action :check_if_admin, only: [:index]

  def check_if_admin
    if not current_user.admin?
      redirect_to "/"
    end
  end

  def create
    @cart = Cart.new
    @cart.buyer_id = params[:buyer_id]
    @cart.item_id = params[:item_id]

    if @cart.save
      redirect_to "/my_cart", :notice => "Item added to cart."
    else
      redirect_to "/my_cart"
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
    @carts = Cart.where(:buyer_id => current_user.id)
    #@sellers = Cart.where(:buyer_id => current_user.id).joins(item: :user).select(:name).distinct
    @sellers = Cart.where(:buyer_id => current_user.id).joins(:item).select(:user_id).distinct
    # @batman = User.where(:user_id => @sellers_id.user_id)


    @pictures = Picture.all
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
    @cart.buyer_id = params[:buyer_id]
    @cart.item_id = params[:item_id]

    if @cart.save
      redirect_to "/carts", :notice => "Cart item successfully updated."
    else
      render "new_form"
    end
  end
end
