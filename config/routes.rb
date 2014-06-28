Rails.application.routes.draw do

  resources :users do
    resources :contact_requests, only: [:create]
  end

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  root to: 'users#home'
end
