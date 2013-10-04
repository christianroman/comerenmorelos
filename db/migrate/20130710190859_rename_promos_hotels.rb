class RenamePromosHotels < ActiveRecord::Migration
  def change
      rename_table :promos_hotels, :hotel_promo
  end
end
