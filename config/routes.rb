Rails.application.routes.draw do
  
  get "/about", to: "about#index"
 # root "main#index"   OR    root to: "main#index"    OR get "", to: "main#index"
 # get "/", to: "main#index"
  root "main#index"

  #rout para registration
  get"sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest


  
end
