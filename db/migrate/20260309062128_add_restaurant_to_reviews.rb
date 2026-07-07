class AddRestaurantToReviews < ActiveRecord::Migration[8.1]
  def change
    add_reference :reviews, :restaurant, null: false, foreign_key: true
  end
end
