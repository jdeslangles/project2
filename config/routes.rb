Project2::Application.routes.draw do

 devise_for :users do
    get "/login" => "devise/sessions#new"
    get "/register" => "devise/registrations#new"
  end

  resources :users
  resources :albums do
    resources :photos
  end
  resources :comments

  root to: "users#index"

  
  	get'login', to:'devise/sessions#new'
 

  resources :sessions, only: [:create, :destroy]
end
