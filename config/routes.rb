Rails.application.routes.draw do
  resources :users
  resources :transactions
  resources :stocks
  resources :portfolios
  
  post "/login", to: "login#sign_in", as: "login"
  delete "/", to: "login#destroy"
  root to: "login#new"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
