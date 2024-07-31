# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :realties, only: %i[index show] do
        resources :bookings, only: %i[create]
      end
      namespace :manage do
        resources :realties, only: %i[index show create update destroy] do
          resources :bookings, only: %i[index create update]
          resources :prices, only: %i[index update]
        end
        resources :rates, only: %i[index create update] 
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
