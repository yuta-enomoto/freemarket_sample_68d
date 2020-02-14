Rails.application.routes.draw do
  root 'users#show'
  resources :users, only: [:show]
  resources :items, only: [:new]
  devise_for :users
end
