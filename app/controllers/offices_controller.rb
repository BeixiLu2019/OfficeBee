class OfficesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @user = current_user
    @office = Office.new
  end

  def create
    @office = Office.new(offices_params)
    @user = User.find(params[:user_id])
    @office.user = @user
    @office.save

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def offices_params
    params.require(:office).permit(:city, :start_date, :end_date, :max_capacity, :price, :address, :description, :name )
  end
end
