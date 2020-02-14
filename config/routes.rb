Rails.application.routes.draw do
  get 'orders/new'
  root "orders#new"
end
