Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root 'home#index'
  resources :users, only: [:index, :show, :edit, :update]
    resources :addresses, only: [:new, :create, :edit, :update]
    resources :credit_cards, only: [:new, :create, :edit, :update, :destroy]
  resources :oders, only: [:new]
  resources :items, except: [:index]
end
