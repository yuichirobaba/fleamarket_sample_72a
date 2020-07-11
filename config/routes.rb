Rails.application.routes.draw do
  get 'markup_preview', to: 'markup_preview#index'
  get 'users', to: 'users#index'
  root 'items#index'
end
