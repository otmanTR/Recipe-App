Rails.application.routes.draw do
  devise_for :users

  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users
  resources :foods, only: [:index, :new, :create, :destroy] 
  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
  end
end

