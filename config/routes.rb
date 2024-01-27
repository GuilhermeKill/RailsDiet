# config/routes.rb
Rails.application.routes.draw do
  devise_for :users
    resources :users, only: [:create, :update, :index, :show]

    resources :meals, only: [:create, :update, :index, :show]

    
end