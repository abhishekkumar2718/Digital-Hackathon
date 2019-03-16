Rails.application.routes.draw do
  root 'event#index'
  #get 'event/index'
  #get 'sessions/new'
  #get 'sessions/create'
  #get 'sessions/destroy'
  resources :elections
  resources :candidates
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  #get ‘signup’, to: ‘users#new’, as: ‘signup’
  #get ‘login’, to: ‘sessions#new’, as: ‘login’
  #get ‘logout’, to: ‘sessions#destroy’, as: ‘logout’
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  

end
