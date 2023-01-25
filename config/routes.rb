Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  root to: "orders#index"

  resources :orders, only: [:index, :create]
end
