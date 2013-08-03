Project2::Application.routes.draw do

  resources :users do
    resources :albums do
      resources :photos
    end
  end

  resources :comments
  resources :sessions, only: [:new, :create, :destroy]

  get '/my_profile', to: 'users#my_profile', as: :my_profile
  get'login', to:'sessions#new'

  root to: "users#index"

end
