class ConditionsController < ApplicationController

  before_action :authenticate_user!
  before_action :check_if_admin

  def check_if_admin
    if not current_user.admin?
      redirect_to "/"
    end
  end

  def create
    @condition = Condition.new
    @condition.label = params[:label]
    @condition.description = params[:description]

    if @condition.save
      redirect_to "/conditions", :notice => "Condition created successfully."
    else
      render "new_form"
    end
  end

  def destroy
    @condition = Condition.find(params[:id])
    @condition.destroy
    redirect_to "/conditions", :notice => "Condition deleted successfully."
  end

  def edit
    @condition = Condition.find(params[:id])
  end

  def index
    @conditions = Condition.all
  end

  def new
    @condition = Condition.new
  end

  def show
    @condition = Condition.find(params[:id])
  end

  def update
    @condition = Condition.find(params[:id])
    @condition.label = params[:label]
    @condition.description = params[:description]

    if @condition.save
      redirect_to "/conditions", :notice => "Condition updated successfully."
    else
      render "new_form"
    end
  end
end
