class AddLatLngToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :lat, :float
    add_column :hotels, :lng, :float
  end
end
