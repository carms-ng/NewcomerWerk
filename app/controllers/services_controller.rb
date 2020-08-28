class ServicesController < ApplicationController
  before_action :find_service, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # check for search input
    if params[:search].present?
      # return services with name matching search input
      search
    else
      # return all
      @services = Service.includes(user: [photo_attachment: [:blob]], photos_attachments: [:blob]).geocoded.shuffle
    end
    # create markers
    @markers = map_markers(@services)
  end

  def show
    # includes only 1 marker
    @markers = map_markers([@service])
    # booking form params
    @booking = Booking.new
    # find reviews for the services through bookings
    @reviews = Review.joins(:bookings).where(bookings: { service: @service })
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

  def edit
  end

  def update
    # check if @service is valid
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

  def search
    @keyword = params[:search]
    # Using pg search
    @services = Service.global_search_by_user_service(@keyword)

    # Using activerecord
    # sql_query = " \
    #   users.first_name @@ :query \
    #   OR users.last_name @@ :query \
    #   OR services.title @@ :query \
    #   OR services.description @@ :query \
    #   OR services.address @@ :query \
    # "
    # @services = Service.joins(:user)
    #                    .where(sql_query, query: "%#{@keyword}%")
    #                    .geocoded.shuffle
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
