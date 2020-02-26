class BookingsController < ApplicationController
  before_action :set_office, only: [:new, :show, :edit, :create, :destroy]
  def new
    @booking = Booking.new
  end
  def create
    @booking = Booking.new(booking_params)
    @booking.office = @office
    @booking.save
    redirect_to dashboard_path
    # link needs to be updated to booking#SHOW
  end
  def show
    # total price of one booking should be added on show page
  end

  def destroy

  end

  private
  def set_office
    @office = Office.find(params[:office_id])
  end
  def booking_params
    params.require(:office).permit(:date, :number_of_guests, :total_price, :office_id, :user_id)
  end
end
