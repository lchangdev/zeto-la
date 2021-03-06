Rails.application.routes.draw do

  resources :users, except: [:new, :create] do
    resources :contact_requests, only: [:new, :create]
  end

  resources :posts do
    resources :members, only: [:create, :destroy]
  end

  namespace :admin do
    resources :users, only: [:index, :destroy, :edit, :update]
  end

  match '/about', to: 'users#about', via: [:get, :post]
  match '/contact', to: 'users#contact', via: [:get, :post]
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  root to: 'users#home'
end
