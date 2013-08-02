Project2::Application.routes.draw do
  # get "sessions/new"

  # get "sessions/create"

  # get "sessions/destroy"

  resources :users
  resources :albums
  resources :photos
  resources :comments

  root to: "users#index"

  get'login',to:'sessions#new'

  resources :sessions, only: [:new, :create, :destroy]  
end
