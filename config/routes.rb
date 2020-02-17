Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :items, only: [:show, :new]
  resources :users, only: [:show]
  resources :oders, only: [:new]
end
  