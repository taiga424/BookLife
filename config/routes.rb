Rails.application.routes.draw do
  devise_for :users
  root 'books#index'

  namespace :books do
    resources :comics, only: :index
    resources :searches, only: :index
    resources :tankobons, only: :index
    resources :bunkos, only: :index
  end

  resources :books do 
    resources :comments
  end
  
  resources :users, only: :show

  resources :users, only: [:show, :edit, :update] do
    resources :books, only: [:new, :create, :show] do
      resources :likes, only: [:create, :destroy]
    end
  end

end
