Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :signs
  resources :bookmarks
  # resources :comments, only: [ :new, :create ] - should be nested inside :signs
  # resources :comments, only: [ :edit, :update, :destroy ]
  # resources :bookmarks, only: [ :index, :destroy ]
  # resources :categories, only: [ :index, :show ]
  # resources :lists do
  #   resources :bookmarks, only: [ :new, :create ]
  # end
  # get 'dashboard', to: 'pages#dashboard'
end
