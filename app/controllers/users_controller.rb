class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
    @reviews_written = @user.reviews
    @reviews_received = Review.joins(booking: :service).where(services: { user_id: @user.id })
  end

end
