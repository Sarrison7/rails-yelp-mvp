class ReviewsController < ApplicationController
  before_action :set_restaurants, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entitty
    end
  end

  def destroy
    @review = Review.new.find(params[:id])
    @review.destroy
    redirect_to restaurant_paty(@review.restaurant), status: :see_other
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).premit(:content)
  end
end
