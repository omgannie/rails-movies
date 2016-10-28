Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'movies#index'
  root to: 'movies#index'

  resources :users, only: [:index, :new, :create]
  resources :sessions, only: [:index, :new]

  resources :movies, only: [:index, :show, :new, :create]
  resources :genres, only: [:index, :show]

  # COMMENTS URLS
  get '/reviews/:review_id/comments/new' => 'comments#new', as: 'new_comment'
  post '/reviews/:review_id/comments' => 'comments#create'
  get '/reviews/:reviews_id/comments/:id' => 'comments#show'

  get '/login' => 'sessions#new', as: 'new_login'
  post '/login' => 'sessions#create', as: 'login'
  get '/logout' => 'sessions#destroy', as: 'logout'
  # delete '/logout' => 'sessions#destroy', as: 'logout'

  get '/movies/:movie_id/reviews/new' => 'reviews#new'
  post '/movies/:movie_id/reviews' => 'reviews#create', as: 'new_review'

  get '/movies/:movie_id/ratings/new' => 'ratings#new', as: 'new_movie_rating_link'
  post '/movies/:movie_id/ratings' => 'ratings#create', as: 'create_new_movie_rating'

  get '/reviews/:review_id/ratings/new' => 'ratings#new', as: 'new_review_rating_link'
  post '/reviews/:review_id/ratings' => 'ratings#create', as: 'create_new_review_rating'

end
