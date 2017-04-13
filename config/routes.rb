Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'

end

# Rails.application.routes.draw do
#   devise_for :users

#   get 'welcome/index'

#   get 'welcome/about'

#   root 'welcome#index'

# end


# Rails.application.routes.draw do

#   devise_for :users

#   authenticated :user do
#     root :to => "wikis#index", as: :user_root
#   end

#   root 'welcome#index'

#   # get 'about' => 'welcome#about'

#   resources :wikis
#   resources :charges, only: [:new, :create]

# end