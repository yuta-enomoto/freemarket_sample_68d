Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :items, only: [:show, :new]
  resources :users, only: [:index, :show, :edit, :update]
    resources :addresses, only: [:new, :create, :edit, :update, :destroy]
    resources :payments, only: [:new, :create, :edit, :update, :destroy]
  resources :oders, only: [:new]
end
  