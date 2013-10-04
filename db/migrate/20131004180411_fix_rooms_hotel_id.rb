class FixRoomsHotelId < ActiveRecord::Migration
  def change
    rename_column :rooms, :hotel_id, :restaurant_id
  end
end
