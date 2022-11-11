Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  root "users#index"

  resources :users do
    resources :posts do
      resources :likes
      resources :comments
    end
  end

  devise_for :users, path: ''

  namespace :api do
    resources :users, only: [:index] do
      resources :posts, only: [:index] do
        resources :comments, only: [:index, :create]
      end
    end
  end
end
