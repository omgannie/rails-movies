Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'movies#index'

  resources :users, only: [:index, :new, :create]
  resources :sessions, only: [:index, :new]
  resources :movies, only: [:index, :show]

  get '/login' => 'sessions#new', as: 'new_login'
  post '/login' => 'sessions#create', as: 'login'
  delete '/logout' => 'sessions#destroy', as: 'logout'

  root to: 'movies#index'
end
