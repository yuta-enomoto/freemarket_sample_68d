Rails.application.routes.draw do
  root 'users#show'
  # root 'home#index'
  resources :users, only: [:show]
  resources :items, only: [:new]
  devise_for :users
end
