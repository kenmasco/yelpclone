class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find params[:restaurant_id]
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find params[:restaurant_id]
    @restaurant.reviews << Review.create(params[:review].permit(:name, :content, :rating))
  
    redirect_to restaurant_path(@restaurant)
  end

  def edit
    @restaurant = Restaurant.find params[:restaurant_id]
    @review = Review.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find params[:restaurant_id]
    @review = Review.find params[:id]
    @review.update params[:review].permit(:name, :content, :rating)
    redirect_to @restaurant
  end

  def destroy
    @restaurant = Restaurant.find params[:restaurant_id]
    @review = Review.find params[:id]
    @review.destroy
    redirect_to @restaurant
  end

end
