class OfficesController < ApplicationController
before_action :set_office, only: [:show, :edit, :update, :destroy]

  def index
    @offices = Office.all
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
    redirect_to office_path(@office)
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
    redirect_to office_path(@office)
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
