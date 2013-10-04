class RenameHotelPromosToRestaurantPromos < ActiveRecord::Migration
  def change
    rename_table :hotels_promos, :restaurants_promos
  end
end
