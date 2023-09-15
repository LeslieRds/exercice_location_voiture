class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_car, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def create
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

  def set_car
    @car = Car.find(params[:car_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
