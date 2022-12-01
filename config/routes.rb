Rails.application.routes.draw do
  devise_for :users

  root to: "home#top"
  get "home/about" => "home#about", as: "about"

  resources :books, only: [:new, :index, :show, :create, :destroy, :edit, :update]
  resources :users, only: [:show, :edit, :update, :index]

end