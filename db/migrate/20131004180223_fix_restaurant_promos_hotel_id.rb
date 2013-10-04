class FixRestaurantPromosHotelId < ActiveRecord::Migration
  def change
    rename_column :restaurants_promos, :hotel_id, :restaurant_id
  end
end
