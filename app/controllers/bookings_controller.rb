class BookingsController < ApplicationController
  before_action :set_office, only: [:new, :show, :edit, :create, :destroy]
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.office_id = @office.id
    @booking.user_id = current_user.id
    @booking.save
    redirect_to dashboard_path
    # link needs to be updated to booking#SHOW
  end

  def show #confirmation page
    # total price of one booking should be added on show page
  end

  # def destroy
  #   # office = booking.office
  #   # booking.destroy
  #   # redirect_to dashboard_path(booking)
  #   # # link needs to be updated to booking#SHOW
  # end

  private
  def set_office
    @office = Office.find(params[:office_id])
  end
  def booking_params
    params.require(:booking).permit(:date, :number_of_guests, :office_id, :user_id)
  end
end
