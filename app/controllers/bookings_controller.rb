class BookingsController < ApplicationController

  def new
    @service = Service.find(params[:service_id])
    @booking = Booking.new
    @form_var = [@service, @booking]
  end

  def create
    @service = Service.find(params[:service_id])
    @booking = Booking.new(secure_params)
    @booking.service = @service
    if @booking.save
      # maybe change it to redirect to the dashbord
      redirect_to service_path(@service)
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    @form_var = @booking
  end

  def update
    @booking = Booking.find(params[:id])

    if @booking.update(secure_params)
      # maybe change it to redirect to the dashbord
      redirect_to service_path(@service)
    else
      render :edit
    end
  end

  private

  def secure_params
    # check the user_id
    params_require(:booking).permit(:start, :end, :message)
  end
end
