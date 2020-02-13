Rails.application.routes.draw do

  root 'application#index'
  
  devise_for :users,controllers: {
    registrations:'users/registrations',
    sessions: 'users/sessions'
  }
  
end
 