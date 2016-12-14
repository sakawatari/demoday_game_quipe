Rails.application.routes.draw do
  resources :recommends
  devise_for :users
  resources :games, only: [:index, :show, :edit, :update]
  root 'top#index'

  post 'like/:recommend_id' => 'likes#like', as: 'like'
  delete 'unlike/:recommend_id' => 'likes#unlike', as: 'unlike'
end
