class BuildingsController < ApplicationController

  before_action :authenticate_user!
  before_action :check_if_admin

  def check_if_admin
    if not current_user.admin?
      redirect_to "/"
    end
  end

  def create
    @building = Building.new
    @building.label = params[:label]
    @building.address_line_1 = params[:address_line_1]
    @building.city = params[:city]
    @building.state = params[:state]
    @building.zip = params[:zip]
    @building.country = params[:country]
    if @building.save
      redirect_to "/buildings", :notice => "Building created successfully."
    else
      render "new_form"
    end
  end

  def destroy
    @building = Building.find(params[:id])
    @building.destroy
    redirect_to "/buildings", :notice => "Building deleted successfully."
  end

  def edit
    @building = Building.find(params[:id])
  end

  def index
    @buildings = Building.all
  end

  def new
    @building = Building.new
  end

  def show
    @building = Building.find(params[:id])
  end

  def update
    @building = Building.find(params[:id])
    @building.label = params[:label]
    @building.address_line_1 = params[:address_line_1]
    @building.city = params[:city]
    @building.state = params[:state]
    @building.zip = params[:zip]
    @building.country = params[:country]

    if @building.save
      redirect_to "/buildings", :notice => "Building updated successfully."
    else
      render "new_form"
    end
  end
end
