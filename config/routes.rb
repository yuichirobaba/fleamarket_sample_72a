Rails.application.routes.draw do
  devise_for :create_users, controllers: {
    registrations: 'create_users/registrations',
  }
  devise_scope :create_user do
    get 'delivary_datas', to: 'create_users/registrations#new_delivary_data'
    post  'delivary_datas', to: 'create_users/registrations#create_delivary_data'
  end
  root 'items#index'
  resources :create_users
  resources :products, except: :show
  resources :products_details
  resources :products_purchase
end
  
    
