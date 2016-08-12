Rails.application.routes.draw do
  devise_for :users
  root 'projects#index'
  resources :users, only: [:show, :edit, :update]
  resources :popular
  resources :newest
  resources :projects do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
end
