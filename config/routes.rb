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

  get '/charges', to: 'charges#delete', as: :downgrade #:standard
  resources :charges, only: [:new, :create, :destroy]

  
  get 'welcome/about'

  root 'welcome#index'

end