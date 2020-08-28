Rails.application.routes.draw do
  get 'buyers/index'
  get 'buyers/done'
  devise_for :create_users, controllers: {
    registrations: 'create_users/registrations',
  }
  devise_scope :create_user do
    get 'delivary_datas', to: 'create_users/registrations#new_delivary_data'
    post  'delivary_datas', to: 'create_users/registrations#create_delivary_data'
  end
  root 'items#index'
  resources :items, only: [:index]
  resources :products do
    collection do
      get 'category/get_category_children', to: 'products#get_category_children', default: { format: 'json' }
      get 'category/get_category_grandchildren', to: 'products#get_category_grandchildren', default: { format: 'json' }
    end
    resources :buyers, only: [:index] do
      collection do
        get 'done', to: 'buyers#done'
        post 'pay', to: 'buyers#pay'
      end
    end
  end
  
  resources :products_purchase
  resources :mypages, only: [:index]
  resources :creditcards, only: [:new, :show, :destroy] do
    collection do
      post 'pay', to: 'creditcards#pay'
    end
  end
end

  
    
