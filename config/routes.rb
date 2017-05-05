Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: [:show]

  resources :wikis

  resources :wikis do
    resources :collaborators, only: [:new, :create, :destroy]
  end

  get '/charges', to: 'charges#delete', as: :downgrade #:standard
  resources :charges, only: [:new, :create, :destroy]

  root 'welcome#index'

  get 'welcome/about'
  
end