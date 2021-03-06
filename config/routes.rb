# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :departments
  resources :brands
  resources :issues do
    member do
      post :toogle_published
    end
  end
  resources :vehicles do
    resources :issues, controller: 'vehicle_issues'
  end
  root to: 'vehicles#index'
  get 'archives/index'
  get 'admin/index'
end
