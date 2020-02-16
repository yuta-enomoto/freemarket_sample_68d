Rails.application.routes.draw do
  root 'home#index'
  resources :users, only: [:show]
  resources :items, only: [:new]
end
