Rails.application.routes.draw do
  resources :caa_webhook_logs
  get "test" => "caa_webhook#list_available_agent"
  get "test/agent" => "agents#test"
  resources :queue_chats do
    # resolve with params id
    get "resolve" => "queue_chats#resolve"
  end
  resources :agents
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  post "qiscus/caa/webhook" => "caa_webhook#webhook"
end
