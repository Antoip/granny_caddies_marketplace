class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.booking = params[:booking_id]
  end

  private

  def review_params
    params.require(:review).permit(:)
  end

end
