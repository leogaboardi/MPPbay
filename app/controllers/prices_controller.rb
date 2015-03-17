class PricesController < ApplicationController

  before_action :authenticate_user!
  before_action :check_if_admin

  def check_if_admin
    if not current_user.admin?
      redirect_to "/"
    end
  end

  def create
    @price = Price.new
    @price.item_id = params[:item_id]
    @price.price = params[:price]

    if @price.save
      redirect_to "/prices", :notice => "Price created successfully."
    else
      render "new_form"
    end
  end

  def destroy
    @price = Price.find(params[:id])
    @price.destroy
    redirect_to "/prices", :notice => "Price deleted successfully."
  end

  def edit
    @price = Price.find(params[:id])
  end

  def index
    @prices = Price.all
  end

  def new
    @price = Price.new
  end

  def show
    @price = Price.find(params[:id])
  end

  def update
    @price = Price.find(params[:id])
    @price.item_id = params[:item_id]
    @price.price = params[:price]

    if @price.save
      redirect_to "/prices", :notice => "Price updated successfully."
    else
      render "new_form"
    end
  end
end
