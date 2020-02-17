Rails.application.routes.draw do

  root 'home#index'
  resources :items, only: [:show, :new]
  resources :users, only: [:show]

  devise_for :users,controllers: {
    registrations:'users/registrations',
    sessions: 'users/sessions'
  }
  
end
 