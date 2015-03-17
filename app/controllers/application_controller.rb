class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  # FIXME: Take out border from page navigator

  # TODO: devise: format sign up page
  # TODO: devise: format sign in page
  # TODO: devise: format 'Forgot your password page' page

  # TODO: create Pictures CRUD (check Paperclip)

  # TODO: P2: create SimilarItems model

  protect_from_forgery with: :exception


end
