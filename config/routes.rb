Rails.application.routes.draw do
  resources :data_visualizations, only: %i[ index show ]
  devise_for :users  

  namespace :app do
    resources :users
  end
  resources :imports
  
  root to: "home#index"
  
end
