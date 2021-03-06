class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @booking = Booking.find(params[:booking_id])
  end

  def create
    @review = Review.new(review_params)
    @review.booking = Booking.find(params[:booking_id])
    if @review.save
      redirect_to caddy_path(@review.booking.caddie)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:description,:rating)
  end

end
