Rails.application.routes.draw do
  devise_for :delivary_data
  devise_for :create_users,controllers:{
    registrations: 'registrations',
  }
  root 'items#index'
  resources :products, except: :show
  resources :create_users
  resources :signup do
    collection do
      get 'new'
      get 'new2'
      get 'new3'
      get 'done'
  resources :products_details
 end
end
end
  
    
