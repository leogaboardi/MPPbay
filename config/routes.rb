Rails.application.routes.draw do

  devise_for :users
  root 'root#index'

  resources :users, :items, :addresses, :favorites, :categories,
  :availabilities, :purchases, :pictures, :prices, :buildings, :conditions,
  :statuses, :carts, :offers

  get('/my_cart', { :controller => 'carts', :action => 'my_index' })

  get('/replyoffer', { :controller => 'transaction', :action => 'replyoffer', :as => "reply"  })
  get('/email_offer/:seller_id', { :controller => 'transaction', :action => 'new_email_offer', :as => "new_email_offer"  })
  get('/send_email_offer/:buyer_id/:seller_id', { :controller => 'transaction', :action => 'send_email_offer', :as => "send_email_offer"})

  get('/about', { :controller => 'root', :action => 'about', :as => "about"  })
  get('/buy', { :controller => 'general', :action => 'buy', :as => "buy" })
  patch('/disable/:id', { :controller => 'general', :action => 'disable' })
  get('/item_display/:id', { :controller => 'general', :action => 'item', :as => "item_display" })
  delete('/item_display/:id', { :controller => 'general', :action => 'destroy'})

  get('/sell', { :controller => 'general', :action => 'sell', :as => "sell" })
  get('/summary', { :controller => 'general', :action => 'summary', :as => "summary" })
  patch('/sell/:id', { :controller => 'general', :action => 'put_on_sale' })
  # CREATE ITEM
  get('/sell/new', { :controller => 'general', :action => 'item_new', :as => "item_new" })
  post('/summary', { :controller => 'general', :action => 'create', :as => "create" })
  # UPDATE ITEM
  get('/sell/:id/edit', { :controller => 'general', :action => 'edit' })
  patch('/sell/:id/edit', { :controller => 'general', :action => 'update' })

  patch('/address/:id/main', { :controller => 'addresses', :action => 'make_main' })


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
