class FixPhotosHotelId < ActiveRecord::Migration
  def change
    rename_column :photos, :hotel_id, :restaurant_id
  end
end
