Rails.application.routes.draw do

  resources :users, only: [:show]
  resources :schedules

  root to: 'home#index'
  controller :home do
    get :why
    get :soft
  end

  controller :oauth do
    match '/auth/alipay', action: 'alipay', via: [:get, :post]
  end

  namespace :admin do
    root 'home#index'
  end
  namespace :panel do
    root 'home#index'
  end
  namespace :board do
  end
  namespace :my do
    root 'home#index'
    controller :home do
      get :driver
    end
  end

  scope :my, module: 'waiting/my', as: :my do
    resource :roles
    resources :logs
    resources :order_items
  end

  mount ActionCable.server => '/cable'

end
