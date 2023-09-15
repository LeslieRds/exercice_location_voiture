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
      redirect_to bookings_path
    else
      render :new
    end
  end

  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
