Project2::Application.routes.draw do

  resources :users
  resources :albums do
    resources :photos
  end
  resources :comments

  root to: "users#index"

  get'login', to:'sessions#new'

  resources :sessions, only: [:new, :create, :destroy]
end
