class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reviews_written = @user.reviews
    # Joins booking and service table => to get the user that's the service provider
    @reviews_received = Review.joins(booking: :service)
                              .where(services: { user_id: @user.id })
  end
end
