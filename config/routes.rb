Rails.application.routes.draw do
  get 'services/index'
  get 'services/show'
  get 'users/show'
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'bookings#index'
  get '/profile', to: 'users#show'

  resources :services do
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [:edit, :update] do
    resources :review, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
