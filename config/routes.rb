Rails.application.routes.draw do
  get 'users/show'
  root "users#show"
end
