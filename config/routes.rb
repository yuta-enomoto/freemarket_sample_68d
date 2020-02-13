Rails.application.routes.draw do
  root "items#new"
  resources :users, only: [:show]
end
