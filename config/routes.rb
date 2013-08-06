Project2::Application.routes.draw do

 

  # resources :photos
  # resources :comments, only: [] do
  #   post '/', action: 'create', as: :create, on: :collection
  # end


  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  resources :users, except: [:new, :create, :update, :edit] do
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


  
#  resources :sessions, only: [:new, :create, :destroy]
  # resources :sessions, only: [:new, :read, :create, :destroy]


  resources :comments
  resources :sessions, only: [:new, :read, :create, :destroy]

  get '/photo_wall', to: 'photos#photo_wall', as: :photo_wall

  get '/my_profile', to: 'users#my_profile', as: :my_profile

  root to: 'photos#photo_wall'

end
