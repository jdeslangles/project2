Project2::Application.routes.draw do

  devise_for :user 

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  resources :users, except: [:new, :create, :edit, :update] do
    resources :albums do
      resources :photos
    end
  end

  resources :comments
#  resources :sessions, only: [:new, :create, :destroy]


  get '/my_profile', to: 'users#my_profile', as: :my_profile

  root to: "users#index"

end
