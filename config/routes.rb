Rails.application.routes.draw do
  devise_for :users
  root to: "cosons#index"
  resources :cosons
  resources :users, only: :show
end
