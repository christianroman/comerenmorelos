class FixReservationsHotelId < ActiveRecord::Migration
  def change
    rename_column :reservations, :hotel_id, :restaurant_id
  end
end
