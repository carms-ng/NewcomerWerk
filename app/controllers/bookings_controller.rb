class BookingsController < ApplicationController
  require 'Date'

  def index
    @booking = Booking.find(:id)
  end

  def new
    @service = Service.find(params[:service_id])
    @booking = Booking.new
  end

  def create
    @service = Service.find(params[:service_id])
    @booking = Booking.new(secure_params)
    @booking.service = @service
    @booking.user = current_user
    if @booking.save
      # maybe change it to redirect to the dashbord
      redirect_to service_path(@service)
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    # @form_var = @booking
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
    params[:booking][:start] = DateTime.new(params[:booking]['start(1i)'].to_i, params[:booking]['start(2i)'].to_i, params[:booking]['start(3i)'].to_i, params[:booking]['start(4i)'].to_i, params[:booking]['start(5i)'].to_i)
    params[:booking][:end] = DateTime.new(params[:booking]['end(1i)'].to_i, params[:booking]['end(2i)'].to_i, params[:booking]['end(3i)'].to_i, params[:booking]['end(4i)'].to_i, params[:booking]['end(5i)'].to_i)
    params.require(:booking).permit(:start, :end, :message)
  end
end
