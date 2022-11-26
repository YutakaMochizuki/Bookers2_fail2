Rails.application.routes.draw do
 root to: "homes#top"
 devise_for :users
 get 'homes/about' => 'homes#about', as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 resources :application, only: [:new, :create, :edit, :update]
 resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
 resources :users, only: [:index, :show, :edit, :update]
 get 'books/:id' => 'books#show'
 get 'users/index' => 'users#index'
 get 'users/:id' => 'users#show', as: 'show'
 post 'users/:id' => 'books#show'
 patch 'books/:id' => 'books#update', as: 'update_book'

end