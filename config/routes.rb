Rails.application.routes.draw do
  resources :strategics
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  namespace :api do
    namespace :v1 do
      resources :kelompok_anggarans
      resources :tematiks
      resources :users do
        resources :profiles
      end
      resources :pohons
      resources :strategis
      resources :lembagas
      resources :subkegiatans
      resources :kegiatans
      resources :programs
      resources :bidang_urusans
      resources :urusans
      resources :indikators
      resources :tujuans
      resources :tahuns
      resources :periodes
      resources :opds
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check, subdomain: 'api'

  # Defines the root path route ("/")
  # root "posts#index"
end
