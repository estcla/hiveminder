Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  resources :tags, only: [:index, :show]
  resources :inspections
  resources :hives
  resources :users

end
