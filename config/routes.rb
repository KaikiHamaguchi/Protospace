Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  resources :users only: [:index, :edit, :show]
  resources :prototypes
end
