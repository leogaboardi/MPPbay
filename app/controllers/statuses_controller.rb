class StatusesController < ApplicationController

  before_action :authenticate_user!
  before_action :check_if_admin

  def check_if_admin
    if not current_user.admin?
      redirect_to "/"
    end
  end

  def create
    @status = Status.new
    @status.label = params[:label]
    if @status.save
      redirect_to "/statuses", :notice => "Status created successfully."
    else
      render "new_form"
    end
  end

  def destroy
    @status = Status.find(params[:id])
    @status.destroy
    redirect_to "/statuses", :notice => "Status deleted successfully."
  end

  def edit
    @status = Status.find(params[:id])
  end

  def index
    @statuses = Status.all
  end

  def new
    @status = Status.new
  end

  def show
    @status = Status.find(params[:id])
  end

  def update
    @status = Status.find(params[:id])
    @status.label = params[:label]

    if @status.save
      redirect_to "/statuses", :notice => "Status updated successfully."
    else
      render "new_form"
    end
  end
end
