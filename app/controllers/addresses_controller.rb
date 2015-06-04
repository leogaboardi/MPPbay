class AddressesController < ApplicationController

  before_action :authenticate_user!
  before_action :check_if_admin, only: [:index, :show]

  # FIXME: field names (https://developers.google.com/web/fundamentals/input/form/label-and-name-inputs)

  #Checks if current_address is admin, and therefore can play around with the venue table
  def check_if_admin
    if not current_user.admin?
      redirect_to "/"
    end
  end

  def create
    @address = Address.new
    if current_user.admin?
      @address.user_id = params[:user_id]
    else
      @address.user_id = current_user.id
    end
    @address.full_name = params[:full_name]
    @address.address_line_1 = params[:address_line_1]
    @address.address_line_2 = params[:address_line_2]
    @address.city = params[:city]
    @address.state = params[:state]
    @address.zip = params[:zip]
    @address.country = params[:country]
    @address.phone_number = params[:phone_number]
    @address.main = params[:main]

    # Makes sure there is only 1 main address for every user
    @main = Address.where(:user_id => params[:user_id], :main =>true )
    if params[:main]
      @main.each do |address|
        address.main = false
        address.save
      end
    end

    if @address.save
      redirect_to "/summary", :notice => "Address created successfully."
    else
      render "new_form"
    end
  end

  def destroy
    @address = Address.find(params[:id])
    if current_user.admin? || @address.user_id == current_user.id
      @address.destroy
    end

    redirect_to "/summary", :notice => "Address deleted successfully."
  end

  def edit
    @address = Address.find(params[:id])
    if current_user.admin? || @address.user_id == current_user.id
    else
      redirect_to root_path
    end
  end

  def index
    @addresses = Address.all
  end

  def new
    @address = Address.new
    @main = Address.where(:user_id => current_user.id, :main=>true)
  end

  def make_main
    @address = Address.find(params[:id])

    # Makes sure there is only 1 main address for every user
    @main = Address.where(:user_id => @address.user_id, :main =>true )
    @main.each do |address|
      address.main = false
      address.save
    end

    @address.main = true
    @address.save
    redirect_to "/summary", :notice => @address.full_name+" is now your main address"
  end

  def show
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if current_user.admin? || @address.user_id == current_user.id
      if current_user.admin?
        @address.user_id = params[:user_id]
      else
        @address.user_id = current_user.id
      end
      @address.full_name = params[:full_name]
      @address.address_line_1 = params[:address_line_1]
      @address.address_line_2 = params[:address_line_2]
      @address.city = params[:city]
      @address.state = params[:state]
      @address.zip = params[:zip]
      @address.country = params[:country]
      @address.phone_number = params[:phone_number]
      @address.main = params[:main]

      # Makes sure there is only 1 main address for every user
      @main = Address.where(:user_id => params[:user_id], :main =>true )
      if params[:main]
        @main.each do |address|
          address.main = false
          address.save
        end
      end

      if @address.save
        redirect_to "/summary", :notice => "Address updated successfully."
      else
        render "new_form"
      end
    else
      redirect_to root_path
    end
  end
end
