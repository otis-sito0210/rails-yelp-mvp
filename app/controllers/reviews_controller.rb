class ReviewsController < ApplicationController
  before_action :set_restaurant, only: %i[new create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      flash[:notice] = "Thank you for your review!"
      redirect_to restaurant_path(@restaurant)
    else
      flash[:alert] = "Error saving the review."
      render :new
      # redirect_to restaurant_path(@restaurant)
    end

  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
