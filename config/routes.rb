Rails.application.routes.draw do
  devise_for :users   
  root 'items#index'
  resources :products, except: :show
  resources :users
  resources :products_details
end
