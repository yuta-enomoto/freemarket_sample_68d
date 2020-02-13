Rails.application.routes.draw do
  root "users#show"
  resources :items, only: [new:]
end
