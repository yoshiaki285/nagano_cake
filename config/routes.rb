Rails.application.routes.draw do
  namespace :admin do
    resources :orders, only: [:show, :update]
  end
  namespace :admin do
    resources :order_details, only: [:update]
  end
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end
  namespace :admin do
    resources :genres, only: [:index, :edit, :create, :update]
  end
  namespace :admin do
    resources :items, only: [:index, :new, :show, :edit, :create, :update]
  end
  namespace :admin do
    get '/' => 'homes#top'
  end
  scope module: :public do
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end
  scope module: :public do
    resources :orders, only: [:new, :confirm, :complete, :create, :index, :show]
  end
  scope module: :public do
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
  end
  scope module: :public do
    resources :customers, only: [:show, :edit, :update, :unsubscribe, :withdraw]
  end
  scope module: :public do
    resources :items, only: [:index, :show]
  end
  scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about', as: 'about'
  end
  # 顧客用
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
