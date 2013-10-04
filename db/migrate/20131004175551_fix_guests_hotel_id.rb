class FixGuestsHotelId < ActiveRecord::Migration
  def change
    rename_column :guests, :hotel_id, :restaurant_id
  end
end
