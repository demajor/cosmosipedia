Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  root 'welcome#index'
  get 'welcome/index'
  get 'welcome/about'
  # get 'about' => 'welcome#about'

  resources :wikis

end

# Rails.application.routes.draw do

#   root 'welcome#index'

#   get 'welcome/index'

#   get 'welcome/about'

#   # get 'charges/create'
#   # get 'about' => 'welcome#about'

#       devise_for :users, controllers: {
#         sessions: 'users/sessions'
#       }
#     end

#       # resources :wikis

#       resources :wikis do
#       resources :collaborators, only: [:new, :create, :destroy]


#       resources :charges, only: [:new, :create]

#       resources :users do
#       member do
#       post :downgrade
#     end
#   end
# end





