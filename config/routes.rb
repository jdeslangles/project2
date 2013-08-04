Project2::Application.routes.draw do

  resources :photos

  resources :users do
    resources :albums do
      resources :photos do
        member do
          post :like
          post :unlike
        end
      end
    end
  end

  resources :comments
  resources :sessions, only: [:new, :create, :destroy]


  get '/photo_wall', to: 'photos#photo_wall', as: :photo_wall

  get '/my_profile', to: 'users#my_profile', as: :my_profile
  get'login', to:'sessions#new'

  root to: "users#index"

end
