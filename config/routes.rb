Rails.application.routes.draw do
  
  devise_for :users
   
  
  root 'items#index'

  resources :signup, only: [:create] do 
    collection do
      get 'new'
      get 'user_registration'
    end
end
end
