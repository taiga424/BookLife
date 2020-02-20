Rails.application.routes.draw do
  devise_for :users
  root to: 'books#index'
  namespace :books do
    resources :searches, only: :index
  end
  resources :books do
    resources :comments, only: :create
  end
  resources :users, only: :show
end
