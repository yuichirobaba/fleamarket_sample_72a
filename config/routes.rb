Rails.application.routes.draw do
  devise_for :users   
  root 'items#index'
  resources :products
  resources :users

end
