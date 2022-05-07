Rails.application.routes.draw do
  # sidekiq
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'  

  resources :data_visualizations, only: %i[ index show ]
  get 'visualizations/:id/', to: 'data_visualizations#visualizations'

  devise_for :users  

  namespace :app do
    resources :users
  end
  resources :imports
  
  root to: "home#index"
  resources :messages, only: %i[ create ]
end
