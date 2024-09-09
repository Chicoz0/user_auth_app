Rails.application.routes.draw do
  
 # Root alternatives: root "main#index"                  root to: "main#index"                get "", to: "main#index"                 get "/", to: "main#index"
  root "main#index"

  #Rout for user actions
  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"

  get"sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  delete "logout", to: "sessions#destroy"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"


  #Rout para página about
  get "/about", to: "about#index"

  # Routes that already were in here from step one
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest



  
end
