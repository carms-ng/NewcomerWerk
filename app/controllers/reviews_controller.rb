class ReviewsController < ApplicationController
  def new
  end

  def create
    @booking = Booking.new(params[:booking_id])
    @review = Review.new(review_params)
    review.booking = booking
    if review.save
      redirect_to booking_path(@booking)
    else
      render: new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
