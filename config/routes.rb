Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  root 'categories#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create]
  resources :fishings, only: [:new, :create, :destroy, :edit, :update]
  resources :votes, only: [:new, :create, :destroy]
  resources :categories, only: [:index, :show, :new, :create]
end