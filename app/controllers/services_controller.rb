class ServicesController < ApplicationController
  before_action :find_service, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # check for search input
    if params[:search].nil?
      # return all
      @services = Service.geocoded.shuffle
    else
      # return services with name matching search input
      search
    end
    # create markers
    @markers = map_markers(@services)
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
    # includes only 1 marker
    @markers = map_markers([@service])
    # booking form params
    @booking = Booking.new
    # find reviews for the services through bookings
    @reviews = Review.joins(:bookings).where(bookings: { service: @service })
  end

  def edit
  end

  def update
    if @service.update(service_params)
      redirect_to service_path(@service)
    else
      # re render the edit page (including the form)
      render :edit
    end
  end

  def destroy
    @service.destroy
    redirect_to services_path
  end

  private

  def search
    @keyword = params[:search]
    @services = Service.where("lower(#{:title}) LIKE ?", "%#{@keyword.downcase}%")
                       .geocoded.shuffle
  end

  def find_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:title, :description, :rate, :years_experience, :address, photos: [])
  end

  def map_markers(services)
    services.map do |s|
      {
        rate: s.rate,
        lat: s.latitude,
        lng: s.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { service: s }),
        image_url: 'https://image.flaticon.com/icons/svg/447/447031.svg'
      }
    end
  end
end
