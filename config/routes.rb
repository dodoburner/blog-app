Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'users', to: 'users#index'
  get '/users/:user_id', to: 'users#show'
  get '/users/:user_id/posts', to: 'posts#index'
  get '/posts/new', to: 'posts#new'
  post '/posts/new', to: 'posts#create'
  get '/users/:user_id/posts/:id', to: 'posts#show', as: 'post'
end
