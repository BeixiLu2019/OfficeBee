class BookingsController < ApplicationController
  before_action :set_office, only: [:new, :edit, :create]
  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
      @booking = Booking.new(booking_params)
      @booking.office_id = @office.id
      @booking.user_id = current_user.id
      authorize @booking

      if @booking.save
        redirect_to booking_path(@booking)
      else
        render :new
      end
  end

  def show #confirmation page
    @booking = Booking.find(params[:id])
    authorize @booking
    # total price of one booking should be added on show page
  end

  def destroy
    @booking = Booking.find(params[:id])
    @office = @booking.office_id
    @booking.destroy
    authorize @booking
    redirect_to offices_path
  end

  private
  def set_office
    @office = Office.find(params[:office_id])
  end
  def booking_params
    params.require(:booking).permit(:date, :number_of_guests, :office_id, :user_id)
  end
end
