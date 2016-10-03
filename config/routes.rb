Rails.application.routes.draw do
  resources :games, only: [:index]

  root 'top#index'
end
