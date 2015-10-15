Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  resources :tags, only: [:index, :show]
  resources :hives
  resources :inspections
  resources :users, only: [:show]
end
