class OfficesController < ApplicationController
before_action :set_office, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].nil?
      @offices = Office.all
    elsif params[:search][:date] == "" || params[:search][:city] == ""
      redirect_to root_path
    else
      date = Date.parse(params[:search][:date])
      @offices = Office.near(params[:search][:address], 40)
      @offices = @offices.where(["start_date < ? and end_date > ?", date, date])
      # Office.where(["city = ? and start_date < ? and end_date > ?", params[:search][:city], date, date])
    end

    # Mapbox Code
    @offices_geo = @offices.geocoded #returns flats with coordinates

    @markers = @offices_geo.map do |office|
      {
        lat: office.latitude,
        lng: office.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { office: office })

      }
    end
    #Mapbox Code

  end

  def show
    @office = Office.find(params[:id])
    # @booking = Booking.new
  end

  def new
    @user = current_user
    @office = Office.new
  end

  def create
    @office = Office.new(office_params)
    @office.user = current_user
    @office.save
    redirect_to dashboard_path(@office)
  end

  def edit
  end

  def update
    @office.update(office_params)
    redirect_to office_path(@office)
  end

  def destroy
    @office.destroy
    redirect_to offices_path
  end

private

  def set_office
    @office = Office.find(params[:id])
    # for when we install Pundit :
    # authorize @office
  end

  def office_params
    params.require(:office).permit(:city, :start_date, :end_date, :max_capacity, :price, :address, :description, :name, photos: [])
  end


end
