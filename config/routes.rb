Project2::Application.routes.draw do

  devise_for :user, controllers: {omniauth_callbacks: "omniauth_callbacks", registrations: "registrations" }

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
          get :download
        end
      end
    end
  end

  resources :comments
  resources :pages
  resources :local_photos, only: :show

  get '/photo_wall', to: 'photos#photo_wall', as: :photo_wall
  get '/my_profile', to: 'users#my_profile', as: :my_profile
  match 'search', to: 'search#index', via: [:get, :post], as: :search

  resources :albums do
    get 'page/:page', action: :index, on: :collection
  end

 get '/about', to: 'users#about', as: :about
 get '/thanks_for_registering', to: 'users#thanks_for_registering', as: :thanks_for_registering


  root to: 'photos#photo_wall'

end
