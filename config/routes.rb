Rails.application.routes.draw do
  devise_for :users
  root "rooms#index"
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:index, :new, :create, :edit, :update, :destroy] do
    resources :messages, only: [:index, :create]
  end
end
