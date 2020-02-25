class OfficesController < ApplicationController
  def index
    @offices = Office.where(["city = ? and start_date < ? and end_date > ?", params[:search][:city], params[:search][:date].to_i, params[:search][:date].to_i])
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
