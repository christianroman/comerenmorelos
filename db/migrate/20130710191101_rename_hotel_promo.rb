class RenameHotelPromo < ActiveRecord::Migration
  def change
      rename_table :hotel_promo, :hotels_promos
  end
end
