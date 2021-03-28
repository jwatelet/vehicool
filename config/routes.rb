Rails.application.routes.draw do
  resources :brands
  devise_for :users
  resources :vehicles
  root to: 'vehicles#index'
  get 'archives/index'
  get 'admin/index'
end
