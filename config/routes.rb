Rails.application.routes.draw do
  resources :games, only: [:index, :show, :edit, :update]

  root 'top#index'
end
