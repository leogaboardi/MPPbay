class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  before_filter :general

  def after_sign_in_path_for(resource)
    buy_path
    #request.env['omniauth.origin'] || stored_location_for("/buy") || root_path
  end

  def general
    if user_signed_in?
      @cart_size = "("+Cart.where(:buyer_id => current_user.id).length.to_s+")"
    end
  end

end
