class FixUsersHotelId < ActiveRecord::Migration
  def change
    rename_column :users, :hotel_id, :restaurant_id
  end
end
