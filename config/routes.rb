Rails.application.routes.draw do
  root 'orders#new'
  resources :users, only: [:show]
  resources :items, only: [:new]
  resources :oders, only: [:new]
  devise_for :users
end
