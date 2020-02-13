Rails.application.routes.draw do
  get 'items/new'
  root "items#new"
  
  resources :users, only: [:show]
end
