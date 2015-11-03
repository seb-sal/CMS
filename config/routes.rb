Rails.application.routes.draw do
  root 'companies#index'

  resources :admin
  resources :companies
  # get 'home', to: 'admin#index'
  resources :users, only: [:new, :create]
  get '/signup', to: 'users#new'

  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'

  # get '/logout', to: 'sessions#detroy'

end
