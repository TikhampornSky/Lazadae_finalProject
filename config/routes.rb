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
end
