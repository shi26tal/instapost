Rails.application.routes.draw do
  # root 'home#index'
  root "posts#index"

  resources :users
  resources :sessions, only: [ :new, :create, :destroy ]

  get "signup", to: "users#new", as: "signup"
  get "login", to: "sessions#new", as: "login"
  delete "logout", to: "sessions#destroy", as: "logout"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  # for post
  resources :posts do
    # for comments(nested) - cmt cannot exist independently in our app. It must belong to particular post
    resources :comments
    # only: :create - Because we only need the create action to register an upvote.
    resources :upvotes, only: :create, controller: "posts/upvotes"
    resources :downvotes, only: :create, controller: "posts/downvotes"
  end
end
