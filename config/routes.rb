Rails.application.routes.draw do
  root 'companies#index'

  resources :admin

  resources :companies do
    collection { post :import }
  end
  # get 'home', to: 'admin#index'
  resources :users
  get '/users', to: 'users#index'
  get '/signup', to: 'users#new'
  get '/user/create', to: 'users#create'
  get '/user/edit', to: 'users#edit'
  get '/user/delete', to: 'users#destroy'

  resources :company_contacts
  get '/contacts', to: 'company_contacts#index'

  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  # get '/logout', to: 'sessions#detroy'

end
