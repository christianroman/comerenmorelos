class FixContactsHotelId < ActiveRecord::Migration
  def change
    rename_column :contacts, :hotel_id, :restaurant_id
  end
end
