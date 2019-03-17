Rails.application.routes.draw do
  root 'event#index'
  resources :users
  resources :elections
  resources :candidates
  post "elections/(:id)", to: "elections#show"
  get "user/profile", to: 'users#show', as: :user_profile
  post "user/profile", to: 'users#update'
  get "register", to: "users#new", as: :register
  post "register", to: "users#create"
  resources :sessions, only: [:new, :create, :destroy]
  get "login", to: "sessions#new", as: :login
  get "logout", to: "sessions#destroy", as: :logout
end
