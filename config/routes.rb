Rails.application.routes.draw do
  #resources :recipes
  # resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post "/signup", to: "users#create"
  get "/me", to: "users#show"

  resources :users
  
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "/recipes", to: "recipes#index"
  post "/recipes", to: "recipes#create"

  get "/recipes/:id", to: "recipes#show"
  put "/recipes/:id", to: "recipes#update"
  patch "/recipes/:id", to: "recipes#update"
  delete "/recipes/:id", to: "recipes#destroy"



end
