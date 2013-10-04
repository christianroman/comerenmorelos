class RestaurantsPromo < ActiveRecord::Base
  attr_accessible :restaurant_id, :promo_id
  belongs_to :restaurant
  belongs_to :promo
end
