Project2::Application.routes.draw do

  devise_for :users

  resources :users
  resources :albums do
    resources :photos
  end
  resources :comments

  root to: "users#index"

  get'login', to:'sessions#new'

  resources :sessions, only: [:new, :create, :destroy]
end
