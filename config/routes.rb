Rails.application.routes.draw do
  root 'event#index'
  resources :elections
  resources :candidates
  get "user/profile", to: 'user#show', as: :user_profile
  post "user/profile", to: 'user#update'
  get "register", to: "user#new", as: :register
  post "register", to: "user#create"
  resources :sessions, only: [:new, :create, :destroy]
end
