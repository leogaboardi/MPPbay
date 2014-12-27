Rails.application.routes.draw do

  devise_for :users
  root 'root#index'

  get('/about', { :controller => 'root', :action => 'about', :as => "about"  })

  ##### Routes for the user resource:

  resources :users, :items, :addresses, :favorites, :categories, :availabilities
  #bundle exec rake routes
  # CREATE
  #get('/users/new', { :controller => 'users', :action => 'new', :as => "new" })
  #post('/users', { :controller => 'users', :action => 'create', :as => "create"  })

  # READ
  #get('/users', { :controller => 'users', :action => 'index' })
  #get('/users/:id', { :controller => 'users', :action => 'show', :as=>"show"})

  # UPDATE
  #get('/users/:id/edit', { :controller => 'users', :action => 'edit', :as=>"edit" })
  #put('/users/:id', { :controller => 'users', :action => 'update', :as => "update" })

  # DELETE
  #delete('/users/:id', { :controller => 'users', :action => 'destroy' })

end
