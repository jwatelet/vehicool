Rails.application.routes.draw do
  devise_for :users
  get 'archives/index'
  resources :vehicles
  root to: 'vehicles#index'
end
