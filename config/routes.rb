Rails.application.routes.draw do
  
  # resources :orders
  # get 'orderitems/index'

  # get 'orderitems/show'

  # get 'orderitems/new'

  # get 'orderitems/edit'
  
  resources :orders do
    resources:orderitems
  end
  
  resources :categories
  
  devise_for :users do 
    resources :orders 
  end
  
  get '/checkout' => 'cart#createOrder'
  get '/paid/:id' => 'static_pages#paid'
  
  get 'cart/index'

  resources :items
  root 'static_pages#home'

  get '/help' => 'static_pages#help'
  get '/about' => 'static_pages#about'
  
  get '/aboutSend/:id' => 'static_pages#aboutSend'

  get '/products' => 'items#index'
  get '/category/:title', to: 'static_pages#category'
  
  get '/login' => 'user#login'
  get '/logout' => 'user#logout'
  
  get '/cart/clear', to: 'cart#clearCart'
  get '/cart' => 'cart#index'
  get '/cart/:id', to: 'cart#add'
  get '/cart/remove/:id' => 'cart#remove'
  get '/cart/decrease/:id' => 'cart#decrease'
  
  root :to => 'site#home'
  
  post '/search' => 'items#search'
  
  
  
  #get 'static_pages/home'
  #get 'static_pages/help'
  #get 'static_pages/about'
  #get 'static_pages/products'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
