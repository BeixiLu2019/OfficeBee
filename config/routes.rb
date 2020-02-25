Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :offices, only: [:new, :show, :create, :edit, :update, :destroy]
  end
  resources :offices, only: [:index]
end
