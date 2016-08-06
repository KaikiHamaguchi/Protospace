Rails.application.routes.draw do
  devise_for :users
  root 'projects#index'
  resources :users, only: [:show, :edit, :update]
  resources :projects do
    resources :comments, only: [:create]
  end
end
