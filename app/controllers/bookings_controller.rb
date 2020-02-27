require 'date'

class BookingsController < ApplicationController
  before_action :find_booking, only: [:edit, :update, :mark_as_accepted, :mark_as_declined, :mark_as_completed]

  def index
    # we have to seperate both though
    @bookings_by_you = Booking.where(user: current_user)

    @bookings_for_you = Booking.joins(:service).where(services: { user: current_user })
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
    if !@booking.save
      render "services/show"
    end
  end

  def edit
  end

  def update
    if @booking.update(secure_params)
      # Changes
      # maybe change it to redirect to the dashbord
      redirect_to service_path(@booking.service)
    else
      render :edit
    end
  end

  def mark_as_accepted
    @booking.accepted!
    @booking.save
    redirect_to dashboard_path
  end

  def mark_as_declined
    @booking.declined!
    @booking.save
    redirect_to dashboard_path
  end

  def mark_as_completed
    @booking.completed!
    @booking.save
    redirect_to dashboard_path
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def secure_params
    params[:booking][:start] = DateTime.parse(params[:booking]['start'])
    params[:booking][:end] = DateTime.parse(params[:booking]['end'])
    params.require(:booking).permit(:start, :end, :message)
  end
end
