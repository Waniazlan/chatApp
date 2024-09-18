Rails.application.routes.draw do
    get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy', as: 'signout'

  # Resources routes
  resources :rooms do
    resources :messages
  end
  
  resources :users

  # Root route
  root 'rooms#index'
  mount ActionCable.server => '/cable'
  end