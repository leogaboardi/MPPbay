class CategoriesController < ApplicationController

  before_action :check_if_admin #, only[:index, :create, :update]

  #Checks if current_user is admin, and therefore can play around with the venue table
  def check_if_admin
    if not current_user.admin?
      redirect_to "/"
    end
  end

  def create
    #FIXME: This is not working. It is not saving somehow
    #  Maybe it has to do with the password stuff?
    @category = Category.new
    @category.name = params[:name]
    @category.level = params[:level]
    @category.parent_id = params[:parent_id]

    if @category.save
      redirect_to "/categories", :notice => "Category created successfully."
    else
      render "new_form"
    end
  end

  def delete
    @category = Category.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to "/categories", :notice => "Category deleted successfully."
  end

  def edit
    @category = Category.find(params[:id])
  end

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.name = params[:name]
    @category.level = params[:level]
    @category.parent_id = params[:parent_id]

    if @category.save
      redirect_to "/categories", :notice => "Category updated successfully."
    else
      render "new_form"
    end
  end
end
