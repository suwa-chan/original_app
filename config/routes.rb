Rails.application.routes.draw do
  devise_for :users
  root to: "cosons#index"
  resources :cosons, only: [:index, :new, :create, :show]
end
