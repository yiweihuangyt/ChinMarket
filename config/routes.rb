Rails.application.routes.draw do
  scope "(:locale)", locale: /en|cn|nl/ do
  get 'users/show'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "products#index"
  resources :products do
    resources :bids
  end
  resources :categories
  get "/products/:id/reserveer", to: "products#reserveer"
  get "/products/:id/dereserveer", to: "products#dereserveer"
  get "/products/:id/flag", to: "products#flag"
  get "/users/:id/show", to: "users#show"
  get '/users/:id', to: 'users#show', as: 'user_profile'
  get "/dashboard", to: "dashboards#show"
  post "search", to: "search#index"
end
end
