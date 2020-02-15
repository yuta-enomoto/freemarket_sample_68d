Rails.application.routes.draw do
  root 'home#index'
  resources :users, only: [:show]
  resources :items, only: [:new]
  resources :oders, only: [:new]
  devise_for :users
end
