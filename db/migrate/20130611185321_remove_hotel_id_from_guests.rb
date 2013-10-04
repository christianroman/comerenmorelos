class RemoveHotelIdFromGuests < ActiveRecord::Migration
  def up
    remove_column :guests, :hotel_id
  end

  def down
    add_column :guests, :hotel_id, :integer
  end
end
