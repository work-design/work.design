Rails.application.routes.draw do

  resources :users, only: [:show]
  resources :schedules

  controller :home do
    get :index
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
    root 'home#index'
  end
  namespace :my do
    root 'home#index'
  end

  scope :my, module: 'waiting/my', as: :my do
    resource :roles
    resources :logs
    resources :order_items
  end

  root to: 'home#index'

  require 'sidekiq/web'
  constraints ->(req) { Auth::AuthorizedToken.find_by(token: req.env['rack.session']['auth_token'])&.user&.admin? if req.env['rack.session'].present? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  mount ActionCable.server => '/cable'

end
