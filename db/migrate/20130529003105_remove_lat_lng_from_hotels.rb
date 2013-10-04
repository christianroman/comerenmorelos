class RemoveLatLngFromHotels < ActiveRecord::Migration
  def up
    remove_column :hotels, :lat
    remove_column :hotels, :lng
  end

  def down
    add_column :hotels, :lng, :decimal
    add_column :hotels, :lat, :decimal
  end
end
