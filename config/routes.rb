Rails.application.routes.draw do
  root 'top#index'
  devise_for :users
  resources :recommends
  resources :games, only: [:index, :show, :edit, :update] do
    collection do
      get 'schedule'
      get 'database'
    end
    resources :stocks, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
  end

  post 'like/:recommend_id' => 'likes#like', as: 'like'
  delete 'unlike/:recommend_id' => 'likes#unlike', as: 'unlike'
end
