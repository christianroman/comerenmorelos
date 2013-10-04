class AddsHotelIdToGuests < ActiveRecord::Migration
  def change
      add_column :guests, :hotel_id, :integer
  end
end
