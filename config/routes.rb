Rails.application.routes.draw do
  resources :events
  devise_for :users
  resources :users, only: [:show]
  resources :tweets do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  

  get 'hello/index' => 'hello#index'
  root 'hello#index'
  
  
  end

