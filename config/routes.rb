Rails.application.routes.draw do
  get 'orders/new'
  root "orders#new"
  root 'home#index'
  resources :items, only: [:show, :new]
  resources :users, only: [:show]
end
