Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'welcome#index'
  root 'products#index'

  namespace :admin do
    resources :products
    resources :categories
    resources :orders do
      member do
        post :cancel
        post :ship
        post :shipped
        post :return
      end
    end
  end

#  resources :products do
#     resources :favorites do
#     end
  #   member do
  #    post :add_to_cart
  #    post :favorite
  #    post :unfavorite
  #    put :favorites
  #   end
#   end

  resources :products do
  put :favorites, on: :member
  resources :favorites do
    end
  member do
   post :add_to_cart
   post "favorite" => "products#favorite"
   post "unfavorite" => "products#unfavorite"
  end
end

  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  resources :cart_items

  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
      post :apply_to_cancel
    end
  end

  namespace :account do
    resources :orders
  end

end
