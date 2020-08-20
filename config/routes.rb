Rails.application.routes.draw do
  # authentication pages
  devise_for :users
  # home page
  root to: 'pages#home'
  # profile page
  resources :users, only: [:show]

  # 7 crud routes for services
  resources :services do
    # nested routes to create bookings for a service
    resources :bookings, only: [:create]
  end

  # routes for bookings
  # bookings#index shows all bookings of 1 user (not nested in services)
  resources :bookings, only: [:index, :edit, :update] do
    # nested routes to create reviews for one bookings. 
    resources :reviews, only: [:new, :create]
  end

  # routes to update booking
  patch '/bookings/:id/accept', to: 'bookings#mark_as_accepted', as: :accept
  patch '/bookings/:id/decline', to: 'bookings#mark_as_declined', as: :decline
  patch '/bookings/:id/cancel', to: 'bookings#mark_as_canceled', as: :cancel
  patch '/bookings/:id/complete', to: 'bookings#mark_as_completed', as: :complete
end
