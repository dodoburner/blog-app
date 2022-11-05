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
  get '/users/:user_id/posts/:id/comment', to: 'comments#index', as: 'all_comments'
  post '/users/:user_id/posts/:id/comment', to: 'comments#create_comment', as: 'create_comment'
  delete '/users/:user_id/posts/:id/:comment', to: 'comments#destroy_comment', as: 'destroy_comment'
  post '/users/:user_id/posts/:id/likes', to: 'likes#create_like', as: 'like'
  devise_for :users, path: ''
  root to: 'users#index'
  post 'authenticate', to: 'authentication#authenticate'
  namespace :api do
    resources :users do 
      resources :posts 
    end 
    resources :posts do
       resources :comments 
       resources :likes 
    end
  end
end
