Rails.application.routes.draw do
  get 'my_market/index'
  get '/items/my_inventory_item'
  post '/items/create_myInventory'
  resources :markets
  resources :inventories
  resources :items
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root :to => "users#index"       #Changing first page
  get '/login', to: 'login#index'
  get '/login/create'
  get '/profile', to: 'profile#index'
  get '/profile/changePassword'
  get '/main', to: 'main#index'
  get '/my_inventory', to: 'my_inventory#index'
  get '/my_inventory/create'
  get '/my_inventory/newItem'
  get '/my_inventory/:id', to: 'my_inventory#destroy_item'
  get '/my_market', to: 'my_market#index'
  get '/my_market/buy'
  get '/purchase_history', to: 'purchase_history#index'
  get '/sale_history', to: 'sale_history#index'
  get '/top_seller', to: 'top_seller#index'
  get '/top_seller/calculate'
  get '/top_seller/:status/:start_date/:end_date', to: 'top_seller#index'
end
