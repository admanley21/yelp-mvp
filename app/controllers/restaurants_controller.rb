class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    # render 'restaurants/index.html.erb'
  end
 
  # GET /restaurants/:id
  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant, notice: "Restaurant was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  private
  
  def restaurant_params
      # This 'whitelists' the attributes allowed to be saved to the database
      params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end
end

