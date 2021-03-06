Rails.application.routes.draw do
  root 'companies#index'

  resources :admin

  # get 'home', to: 'admin#index'
  resources :users
  get '/users', to: 'users#index'
  get '/signup', to: 'users#new'
  get '/user/create', to: 'users#create'
  get '/user/edit', to: 'users#edit'
  get '/user/delete', to: 'users#destroy'


  resources :contacts, only: [:index, :show, :edit, :new]
  resources :companies, shallow: true do
    collection { post :import }

    resources :contacts
  end

  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  # get '/logout', to: 'sessions#detroy'

end
