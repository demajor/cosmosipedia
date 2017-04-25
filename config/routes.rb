Rails.application.routes.draw do
  
  root 'welcome#index'

  get 'welcome/about'

  devise_for :users
  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }
  
  resources :wikis

  resources :wikis do
    resources :collaborators, only: [:new, :create, :destroy]
  end
  
end