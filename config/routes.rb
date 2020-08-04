Rails.application.routes.draw do
  # devise_for :delivary_data
  devise_for :create_users,controllers:{
    registrations: 'registrations',
  }
  root 'items#index'
  resources :products, except: :show #商品データ、下記に商品詳細ページ用のルーティングがあるので(showアクションを除外)
  resources :create_users
  resources :signup do
    collection do
      get 'new'
      get 'new2'
      get 'new3'
      get 'done'
  resources :products_details #商品詳細ページ
 end
end
end
  
    
