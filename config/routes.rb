Rails.application.routes.draw do
  root 'event#index'
  resources :elections
  resources :candidates
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
