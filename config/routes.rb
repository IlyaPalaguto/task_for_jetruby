Rails.application.routes.draw do
  root to: "orders#index"

  resource :orders
end
