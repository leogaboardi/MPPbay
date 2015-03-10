class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  # FIXME: Take out border from page navigator


  # FIXME: Delete the "Delete" action (redundant)
    #Addresses
    #Availabilities
    #Categories
    #Favories
    #Items
    #Users
  # FIXME: use the link_to tag
    #Addresses
    #Availabilities
    #Categories
    #Favories
    #Items
    #Users

  # TODO: devise: format sign up page
  # TODO: devise: format sign in page
  # TODO: devise: format 'Forgot your password page' page

  # TODO: create Prices CRUD
  # TODO: create Pictures CRUD (check Paperclip)
  # TODO: create Buildings CRUD
  # TODO: create Conditions CRUD
  # TODO: create Statuses CRUD

  # TODO: P2: create SimilarItems model

  protect_from_forgery with: :exception


end
