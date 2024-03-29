# Rails.application.routes.draw do
#   devise_for :users
#   resources :categories
#   resources :items
#   resources :users
#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#   # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
#   # Can be used by load balancers and uptime monitors to verify that the app is live.
#   get "up" => "rails/health#show", as: :rails_health_check

#   # Defines the root path route ("/")
#   root "users#index"
# end
Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'categories#index', as: :authenticated_root
  end

  unauthenticated :user do
    root 'users#index', as: :unauthenticated_root
  end

  root "users#index"

  resources :categories
  resources :items

end