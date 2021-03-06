class OfficesController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]
before_action :set_office, only: [:show, :edit, :update, :destroy]

  def index
    @offices = policy_scope(Office)
    if params[:search].nil?
      @offices = Office.all
      authorize @offices
    elsif params[:search][:date] == ""
      @offices = Office.near(params[:search][:address], 40)
      authorize @offices
    elsif params[:search][:address] == ""
      date = Date.parse(params[:search][:date])
      @offices = @offices.where(["start_date < ? and end_date > ?", date+1, date-1])
      authorize @offices
    else
      date = Date.parse(params[:search][:date])
      authorize @offices
      @offices = Office.near(params[:search][:address], 40)
      @offices = @offices.where(["start_date < ? and end_date > ?", date+1, date-1])
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
    authorize @office
    @office = Office.find(params[:id])
    @booking = Booking.new
    authorize @booking

  end

  def new
    @user = current_user
    @office = Office.new
    authorize @office
  end

  def create
    @office = Office.new(office_params)
    @office.user = current_user
    authorize @office
    @office.save
    redirect_to office_path(@office)
  end

  def edit
    authorize @office
  end

  def update
    authorize @office
    @office.update(office_params)
    redirect_to office_path(@office)
  end

  def destroy
    authorize @office
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
    params.require(:office).permit(:start_date, :end_date, :max_capacity, :price, :address, :description, :name, photos: [])
  end


end
