Rails.application.routes.draw do
  resources :ws_events
  resources :shoe_models
  resources :shoe_stores
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
