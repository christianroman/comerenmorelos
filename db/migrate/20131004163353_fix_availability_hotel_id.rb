class FixAvailabilityHotelId < ActiveRecord::Migration
  def change
    rename_column :availabilities, :hotel_id, :restaurant_id
  end
end
