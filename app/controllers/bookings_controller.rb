class BookingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @caddie = Caddie.find(params[:caddy_id])
    @booking = Booking.new
  end

  def create
    @caddie = Caddie.find(params[:caddy_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.caddie = @caddie
    if @booking.save
      redirect_to dashboard_path
    else
      raise
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :price)
  end

end
