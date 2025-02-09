Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "about", to: "about#index", as: :about

  get "sign-up", to: "registrations#new", as: :sign_up

  post "sign-up", to: "registrations#create"

  delete "Logout", to: "sessions#destroy", as: :logout
  get "sign_in", to: "sessions#new", as: :sign_in
  post "sign_in", to: "sessions#create"



  resources :messages, only: [ :index, :new, :create, :show, :edit, :update, :destroy ]
  root to: "main#index"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
