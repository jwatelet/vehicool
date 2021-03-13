Rails.application.routes.draw do
  resources :vehicles
  root to: 'vehicles#index'
end
