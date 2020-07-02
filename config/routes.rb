Rails.application.routes.draw do
  devise_for :users
  # root to: 'services#index'
  root to: 'pages#home'
  # get '/bookings', to: 'bookings#index'
  # get '/profile', to: 'users#show'

  resources :users, only: [:show]

  resources :services do
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [:index]
  resources :bookings, only: [:edit, :update] do
    resources :reviews, only: [:new, :create]
  end

  patch '/bookings/:id/accept', to: 'bookings#mark_as_accepted', as: :accept
  patch '/bookings/:id/decline', to: 'bookings#mark_as_declined', as: :decline
  patch '/bookings/:id/cancel', to: 'bookings#mark_as_canceled', as: :cancel
  patch '/bookings/:id/complete', to: 'bookings#mark_as_completed', as: :complete

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
