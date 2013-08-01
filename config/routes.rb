Project2::Application.routes.draw do
  resources :users
  resources :albums
  resources :photos
  resources :comments

  root to: "users#index"
end
