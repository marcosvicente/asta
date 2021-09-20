Rails.application.routes.draw do
    devise_for :users  

    namespace :app do
      resources :users
    end
    resources :imports
    
    root to: "home#index"
  
end
