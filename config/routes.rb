Rails.application.routes.draw do
  # root to: 'application#index'
  root 'movies#index'
  
  resources :movies
  resources :registrations, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
