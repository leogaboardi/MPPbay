class PurchasesController < ApplicationController

  # TODO: Data validation
  # TODO: relationship with User (buyer and seller), Item

  before_action :authenticate_user!
  before_action :check_if_admin #, only[:index, :create, :update]

  #Checks if current_user is admin, and therefore can play around with the venue table
  def check_if_admin
    if not current_user.admin?
      redirect_to "/"
    end
  end

  def create
    @purchase = Purchase.new
    @purchase.item_id = params[:item_id]
    @purchase.seller_id = params[:seller_id]
    @purchase.buyer_id = params[:buyer_id]

    if @purchase.save
      redirect_to "/purchases", :notice => "Purchase created successfully."
    else
      render "new"
    end
  end

  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy
    redirect_to "/purchases", :notice => "Purchase deleted successfully."
  end

  def edit
    @purchase = Purchase.find(params[:id])
  end

  def index
    @purchases = Purchase.all
  end

  def new
    @purchase = Purchase.new
  end

  def show
    @purchase = Purchase.find(params[:id])
  end

  def update
    @purchase = Purchase.find(params[:id])
    @purchase.item_id = params[:item_id]
    @purchase.seller_id = params[:seller_id]
    @purchase.buyer_id = params[:buyer_id]

    if @purchase.save
      redirect_to "/purchases", :notice => "Purchase updated successfully."
    else
      render "edit"
    end
  end
end
