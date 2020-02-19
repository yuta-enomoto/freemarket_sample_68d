Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root 'home#index'
  resources :items, only: [:show, :new]
  resources :users, only: [:index, :show, :edit, :update]
    resources :addresses, only: [:new, :create, :edit, :update]
    resources :credit_cards, only: [:new, :edit, :update, :show] do
      collection do
        post 'show', to: 'credit_cards#show'
        post 'pay', to: 'credit_cards#pay'
        post 'delete', to: 'credit_cards#delete'
      end
    end
  resources :orders, only: [:new]
end
  