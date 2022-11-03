Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'users', to: 'users#index', as: 'user'
  get '/users/:user_id', to: 'users#show'
  get '/users/:user_id/posts', to: 'posts#index'
  get '/posts/new', to: 'posts#new', as: 'create_post'
  post '/posts/new', to: 'posts#create'
  get '/users/:user_id/posts/:id', to: 'posts#show', as: 'post'
  delete '/users/:user_id/posts/:id', to: 'posts#destroy'
  post '/users/:user_id/posts/:id/', to: 'posts#create_comment'
  post '/users/:user_id/posts/:id/likes', to: 'posts#create_like', as: 'like'
  devise_for :users, path: ''
  root to: 'users#index'
end
