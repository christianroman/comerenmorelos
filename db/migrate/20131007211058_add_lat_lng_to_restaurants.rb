class AddLatLngToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :lat, :decimal, :precision => 15, :scale => 12
    add_column :restaurants, :lng, :decimal, :precision => 15, :scale => 12
  end
end
