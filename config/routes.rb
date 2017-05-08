Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: [:show] do
    member do
      put :downgrade
    end
  end

  resources :wikis do
    member do
      put :add_collaborator
    end
    member do
      delete :delete_collaborator
    end
  end

  resources :wikis do
    resources :collaborators, only: [:new, :create, :destroy]
  end

  get '/charges', to: 'charges#delete', as: :downgrade #:standard
  resources :charges, only: [:new, :create, :destroy]

  root 'welcome#index'

  get 'welcome/about'
  
end