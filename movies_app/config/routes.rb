Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'movies#index'

  resources :users, only: [:index, :new]
  resources :sessions, only: [:index, :new, :destroy]
  resources :movies, only: [:index, :show]

  root to: 'movies#index'
end
