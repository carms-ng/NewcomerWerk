require 'date'

class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
    binding.pry
    @bookings_req_you = Booking.where(user: current_user)
    @bookings_for_you = Booking.where(user: self.service.user)
  end

  def new
    @service = Service.find(params[:service_id])
    @booking = Booking.new
  end

  def create
    @service = Service.find(params[:service_id])
    @booking = Booking.new(secure_params)
    # assign service to booking's service
    @booking.service = @service
    # assign current_user to booking's user
    @booking.user = current_user
    if @booking.save
      # Changes
      # maybe change it to redirect to the dashbord
      redirect_to service_path(@service)
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    # To test
    # @form_var = @booking
  end

  def update
    @booking = Booking.find(params[:id])

    if @booking.update(secure_params)
      # Changes
      # maybe change it to redirect to the dashbord
      redirect_to service_path(@booking.service)
    else
      render :edit
    end
  end

  private

  def secure_params
    params[:booking][:start] = DateTime.new(params[:booking]['start(1i)'].to_i, params[:booking]['start(2i)'].to_i, params[:booking]['start(3i)'].to_i, params[:booking]['start(4i)'].to_i, params[:booking]['start(5i)'].to_i)
    params[:booking][:end] = DateTime.new(params[:booking]['end(1i)'].to_i, params[:booking]['end(2i)'].to_i, params[:booking]['end(3i)'].to_i, params[:booking]['end(4i)'].to_i, params[:booking]['end(5i)'].to_i)
    params.require(:booking).permit(:start, :end, :message)
  end
end
