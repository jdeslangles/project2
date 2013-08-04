Project2::Application.routes.draw do

  resources :photos

  resources :users do
    resources :albums do
      resources :photos do
        member do
          post :like_wall
          post :unlike_wall
          post :like
          post :unlike
        end
        resources :comments
      end
    end
  end


  resources :sessions, only: [:new, :create, :destroy]


  get '/photo_wall', to: 'photos#photo_wall', as: :photo_wall

  get '/my_profile', to: 'users#my_profile', as: :my_profile
  get'login', to:'sessions#new'

  root to: 'photos#photo_wall'

end
