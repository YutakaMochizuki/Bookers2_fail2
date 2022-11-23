Rails.application.routes.draw do
 root to: "homes#top"
 devise_for :users
 get 'homes/about' => 'homes#about', as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 resources :books, only: [:new, :create, :index, :show, :destroy]
 resources :users, only: [:index, :show, :edit, :update]
 get 'books/:id' => 'books#show'
 get 'users/index' => 'users#index'
 get 'users/:id' => 'users#show', as: 'show'

end
