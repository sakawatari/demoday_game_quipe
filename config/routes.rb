Rails.application.routes.draw do
  resources :recommends
  devise_for :users
  resources :games, only: [:index, :show, :edit, :update]

  root 'top#index'
end
