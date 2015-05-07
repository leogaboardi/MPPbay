class OffersController < ApplicationController

  before_action :authenticate_user!
  before_action :check_if_admin, only:[:destroy, :edit, :index, :show, :update]

  def check_if_admin
    if not current_user.admin?
      redirect_to "/"
    end
  end

  def create
    @offer = Offer.new
    if current_user.admin?
      @offer.buyer_id = params[:buyer_id]
    else
      @offer.buyer_id = current_user.id
    end
    @offer.item_id = params[:item_id]

    if @offer.save
      redirect_to "/summary", :notice => "Offer created successfully."
    else
      render "new_form"
    end
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy
    redirect_to "/offers", :notice => "Offer deleted successfully."
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def index
    @offers = Offer.all
  end

  def new
    @offer = Offer.new
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def update
    @offer = Offer.find(params[:id])
    if current_user.admin?
      @offer.buyer_id = params[:buyer_id]
    else
      @offer.buyer_id = current_user.id
    end
    @offer.item_id = params[:item_id]


    if @offer.save
      redirect_to "/offers", :notice => "Offer updated successfully."
    else
      render "new_form"
    end
  end
end
