Project2::Application.routes.draw do

  # resources :photos
  # resources :comments, only: [] do
  #   post '/', action: 'create', as: :create, on: :collection
  # end

  resources :users do
    resources :albums do
      resources :photos do
        member do
          post '/comment', action: 'create', controller: 'comments'
          post :like_wall
          post :unlike_wall
          post :like
          post :unlike
        end
      end
    end
  end

  resources :comments
  resources :sessions, only: [:new, :read, :create, :destroy]

  get '/photo_wall', to: 'photos#photo_wall', as: :photo_wall

  get '/my_profile', to: 'users#my_profile', as: :my_profile
  get'login', to:'sessions#new'

  root to: 'photos#photo_wall'

end
