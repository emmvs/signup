Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :signs do
    resources :bookmarks, only: [ :new, :create ]
    resources :comments, only: [ :new, :create, :update, :destroy ]
  end
  resources :bookmarks, only: [ :update, :destroy ]
  resources :categories, only: [ :index ]
end
