Project2::Application.routes.draw do

  devise_for :user, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  devise_scope :user do
    get '/login', to: 'devise/sessions#new'
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

  resources :comments


  get '/photo_wall', to: 'photos#photo_wall', as: :photo_wall
  get '/my_profile', to: 'users#my_profile', as: :my_profile

  resources :albums do
    get 'page/:page', action: :index, on: :collection
  end

  

  root to: 'photos#photo_wall'

end
