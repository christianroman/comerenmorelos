class FixCategorizationsHotelId < ActiveRecord::Migration
  def change
    rename_column :categorizations, :hotel_id, :restaurant_id
  end
end
