Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  get "signs/requests", to: "signs#requests", as: "requests"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :signs
  resources :categories, only: [ :index, :show ]
  # resources :comments, only: [ :new, :create ] - should be nested inside :signs
  # resources :comments, only: [ :edit, :update, :destroy ]
  # resources :bookmarks, only: [ :index, :destroy ]
  # resources :lists do
  #   resources :bookmarks, only: [ :new, :create ]
  # end
  get 'dashboard', to: 'pages#dashboard'

end
