Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard', as: :dashboard

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :offices do
    resources :bookings, only: [:create, :new]
  end
  resources :bookings, only: [:destroy, :show]
  resources :users, only: :show
end
