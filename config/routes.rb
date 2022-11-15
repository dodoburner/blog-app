Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

<<<<<<< HEAD
  get 'users', to: 'users#index', as: 'user'
  get '/users/:user_id', to: 'users#show'
  get '/users/:user_id/posts', to: 'posts#index'
  get '/posts/new', to: 'posts#new', as: 'create_post'
  post '/posts/new', to: 'posts#create'
  get '/users/:user_id/posts/:id', to: 'posts#show', as: 'post'
  post '/users/:user_id/posts/:id/', to: 'posts#create_comment'
  post '/users/:user_id/posts/:id/likes', to: 'posts#create_like', as: 'like'
  devise_for :users, path: ''
  root to: 'users#index'
=======
  root "users#index"
  resources :users do
    resources :posts do
      resources :likes
      resources :comments
    end
  end
  devise_for :users, path: ''
>>>>>>> 70ca49fcd027ac4c7ad9e44859a4720046f5a6cb
end
