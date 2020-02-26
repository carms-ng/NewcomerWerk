class ServicesController < ApplicationController
  before_action :find_service, only: [:show, :edit, :update, :destroy, :average_ratings]
  skip_before_action :authenticate_user!, only: :index

  def geocode
    @services = Service.geocoded

    @markers = @services.map do |s|
      {
        lat: s.latitude,
        lng: s.longitude
      }
    end
  end

  def index
    if params[:search].nil?
      @services = Service.all
    else
      search
    end
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    @service.user = current_user

    if @service.save
      redirect_to service_path(@service)
    else
      render :new
    end
  end

  def show
    # bookings should go to dashboard
    @bookings = @service.bookings
    @mybooking = @service.bookings.find_by(user: current_user)
    @reviews = Review.joins(:booking).where(bookings: { service: @service })
    average_ratings
  end

  def edit
  end

  def update
    if @service.update(service_params)
      redirect_to service_path(@service)
    else
      render :edit
    end
  end

  def destroy
    @service.destroy

    redirect_to services_path
  end

  private

  def average_ratings
   @average_ratings = @service.reviews.average(:rating).to_i

  end

  def search
    @services = Service.where("title LIKE ?", "%#{params[:search]}%")
  end

  def find_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:title, :description, :rate, :years_experience)
  end
end
