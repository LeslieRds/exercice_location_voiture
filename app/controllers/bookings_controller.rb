class BookingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @car = Car.find(params[:car_id])
    @booking = Booking.new
  end

  def create
    @car = Car.find(params[:car_id])
    @booking = Booking.new(booking_params)
    @booking.car = @car
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @car = @booking.car
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
