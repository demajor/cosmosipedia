Rails.application.routes.draw do
  
  # devise_for :users
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  resources :user, only: [:show]

  resources :wikis

  resources :wikis do
    resources :collaborators, only: [:new, :create, :destroy]
  end

  resources :charges, only: [:new, :create]

  root 'welcome#index'

  get 'welcome/about'
  
end