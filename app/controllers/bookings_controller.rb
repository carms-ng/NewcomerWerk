class BookingsController < ApplicationController

  def new

  end

  def create
    @service = Service.find(:service_id)
    @booking = Booking.new(secure_params)
    @booking.service = @service
    if @booking.save
      # maybe change it to redirect to the dashbord
      rediret_to service_path(@service)
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(prams[:id])
  end

  def update
    @booking = Booking.find(prams[:id])
    @booking.update(params[:booking])
  end

  def secure_params
    # check the user_id
    parms_require(:booking).permit(:start, :end, :message)
  end
end
