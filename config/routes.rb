Rails.application.routes.draw do
  # get "/", to: "users#landing"
  # get "/sign_up", to: "users#sign_up"
  # post "/sign_up", to: "users#create"
  resources :users
  get "/log_in", to: "users#log_in"
  resources :transactions
  resources :stocks
  resources :portfolios
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
