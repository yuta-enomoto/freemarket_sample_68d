Rails.application.routes.draw do
  root 'home#index'
  resources :items, only: [:show, :new]
  resources :users, only: [:show]
end
