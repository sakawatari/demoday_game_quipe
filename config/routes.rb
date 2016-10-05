Rails.application.routes.draw do
  resources :games, only: [:index, :show]

  root 'top#index'
end
