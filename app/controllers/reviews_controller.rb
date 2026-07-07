class ReviewsController < ApplicationController
  # GET /restaurants/:restaurant_id/reviews/new
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  # POST /restaurants/:restaurant_id/reviews
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant =  @restaurant

    if @review.save
      redirect_to @restaurant, notice: "Review was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Create a destroy action for a review
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant), status: :see_other, notice: 'Review deleted'
  end


  private
  
  def review_params
    params.require(:review).permit(:content, :rating)
  end

end

