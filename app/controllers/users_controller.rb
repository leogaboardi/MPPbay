class UsersController < ApplicationController


  # TODO: make a admin user non deleatable
  # TODO: put profile picture?


  before_action :authenticate_user!
  before_action :check_if_admin, only: [ :create, :destroy, :index, :new, :show]

  def check_if_admin
    if not current_user.admin?
      redirect_to "/"
    end
  end

  def create
    #FIXME: This is not working. It is not saving somehow
    #  Maybe it has to do with the password stuff?
    @user = User.new
    @user.name = params[:name]
    @user.email = params[:email]
    @user.phone = params[:phone]
    @user.admin = params[:admin]
    @user.password = "password" #params[:password]
    @user.password_confirmation = "password" #params[:password_confirmation]

    if @user.save
      redirect_to "/users", :notice => "User created successfully."
    else
      render "new"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to "/users", :notice => "User deleted successfully."
  end

  def edit
    @user = User.find(params[:id])
    if current_user.admin? || @user.id == current_user.id
    else
      redirect_to root_path
    end
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if current_user.admin? || @user.id == current_user.id
      @user.name = params[:name]
      @user.email = params[:email]
      @user.phone = params[:phone]
      @user.admin = params[:admin]
      if @user.save
        redirect_to "/summary", :notice => "User updated successfully."
      else
        render "edit"
      end
    else
      redirect_to root_path
    end
  end
end
