class AddressesController < ApplicationController

  # TODO: create form
  # TODO: view
  # TODO: edit form
  # TODO: create / update controller
  # TODO: user association


  before_action :check_if_admin #, only[:index, :create, :update]

  #Checks if current_address is admin, and therefore can play around with the venue table
  def check_if_admin
    if not current_user.admin?
      redirect_to "/"
    end
  end

  def create
    #FIXME: This is not working. It is not saving somehow
    #  Maybe it has to do with the password stuff?
    @address = Address.new
    @address.full_name = params[:full_name]

    if @address.save
      redirect_to "/addresses", :notice => "address created successfully."
    else
      render "new_form"
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to "/addresses", :notice => "address deleted successfully."
  end

  def edit
    @address = Address.find(params[:id])
  end

  def index
    @addresses = Address.all
  end

  def new
    @address = Address.new
  end

  def show
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.full_name = params[:full_name]

    if @address.save
      redirect_to "/addresses", :notice => "address updated successfully."
    else
      render "new_form"
    end
  end
end
