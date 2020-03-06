Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get 'reg_select', to: 'users/registrations#reg_select'
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  
  root 'home#index'
  resources :items, except: [:index] do
    resources :likes, only: [:index, :create, :destroy, :show]
    resources :orders, only: :new do
      collection do
        get 'new', to: 'orders#new'
        post 'pay', to: 'orders#pay'
        get 'done', to: 'orders#done'
      end
      
    end
  end
  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get 'seller', to: 'users#seller'
    end
  end
  resources :addresses, only: [:new, :create, :edit, :update]
  resources :credit_cards, only: [:new, :show] do
    collection do
      get 'edit', to: 'credit_cards#edit'
      post 'show', to: 'credit_cards#show'
      post 'pay', to: 'credit_cards#pay'
      post 'delete', to: 'credit_cards#delete'
    end
  end
  resources :seles, only: :index do
    collection do
      get 'history', to: 'seles#history'
      get 'deposit_list', to: 'seles#deposit_list'
      post 'request_all', to: 'seles#request_all'
      post 'cancel_all', to: 'seles#cancel_all'
    end
    member do
      post 'request_one', to: 'seles#request_one'
      post 'cancel_one', to: 'seles#cancel_one'
    end
  end
  resources :searches do 
    collection do 
      get 'detail_search' 
    end
  end
end
