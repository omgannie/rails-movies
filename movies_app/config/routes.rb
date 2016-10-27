Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'movies#index'
  root to: 'movies#index'

  resources :users, only: [:index, :new, :create]
  resources :sessions, only: [:index, :new]
  resources :movies, only: [:index, :show]
  resources :genres, only: [:index, :show]

  # COMMENTS URLS
  get '/reviews/:review_id/comments/new' => 'comments#new'
  post '/reviews/:review_id/comments' => 'comments#create'
  get '/reviews/:reviews_id/comments/:id' => 'comments#show'

  get '/login' => 'sessions#new', as: 'new_login'
  post '/login' => 'sessions#create', as: 'login'
  delete '/logout' => 'sessions#destroy', as: 'logout'


end
