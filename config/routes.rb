Rails.application.routes.draw do
  get 'payments/new'
  get 'payments/create'
  get 'payments/edit'
  get 'payments/update'
  get 'payments/destroy'
  get 'addresses/new'
  get 'addresses/create'
  get 'addresses/edit'
  get 'addresses/update'
  get 'addresses/destroy'
  devise_for :users
  root 'home#index'
  resources :items, only: [:show, :new]
  resources :users, only: [:index, :show, :edit, :update]
  resources :oders, only: [:new]
end
  