Rails.application.routes.draw do
  resources :bidang_urusans
  resources :urusans
  resources :indikators
  resources :tujuans
  resources :tahuns
  resources :periodes
  resources :opds
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  namespace :api do
    namespace :v1 do
      resources :lembagas
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check, subdomain: 'api'

  # Defines the root path route ("/")
  # root "posts#index"
end
