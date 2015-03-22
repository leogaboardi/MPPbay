Rails.application.routes.draw do

  devise_for :users
  root 'root#index'


  resources :users, :items, :addresses, :favorites, :categories,
  :availabilities, :purchases, :pictures, :prices, :buildings, :conditions,
  :statuses

  get('/about', { :controller => 'root', :action => 'about', :as => "about"  })
  get('/buy', { :controller => 'general', :action => 'buy', :as => "buy" })
  get('/item_display/:id', { :controller => 'general', :action => 'item', :as => "item_display" })
  get('/sell', { :controller => 'general', :action => 'sell', :as => "sell" })
  post('/sell', { :controller => 'general', :action => 'create', :as => "create" })
  get('/sell/new', { :controller => 'general', :action => 'item_new', :as => "item_new" })
  get('/summary', { :controller => 'general', :action => 'summary', :as => "summary" })

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
