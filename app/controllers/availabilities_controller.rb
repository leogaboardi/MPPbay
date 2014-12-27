class AvailabilitiesController < ApplicationController

  before_action :check_if_admin #, only[:index, :create, :update]

  #Checks if current_availability is admin, and therefore can play around with the venue table
  def check_if_admin
    if not current_user.admin?
      redirect_to "/"
    end
  end

  def create
    #FIXME: This is not working. It is not saving somehow
    #  Maybe it has to do with the password stuff?
    @availability = Availability.new
    @availability.name = params[:name]
    @availability.email_filter = params[:email_filter]

    if @availability.save
      redirect_to "/availabilities", :notice => "Availability created successfully."
    else
      render "new"
    end
  end

  def delete
    @availability = Availability.find(params[:id])
  end

  def destroy
    @availability = Availability.find(params[:id])
    @availability.destroy
    redirect_to "/availabilities", :notice => "Availability deleted successfully."
  end

  def edit
    @availability = Availability.find(params[:id])
  end

  def index
    @availabilities = Availability.all
  end

  def new
    @availability = Availability.new
  end

  def show
    @availability = Availability.find(params[:id])
  end

  def update
    @availability = Availability.new
    @availability.name = params[:name]
    @availability.email_filter = params[:email_filter]

    if @availability.save
      redirect_to "/availabilities", :notice => "Availability updated successfully."
    else
      render "edit"
    end
  end
end
