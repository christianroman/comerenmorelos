class CreatePromosHotels < ActiveRecord::Migration
  def change
    create_table :promos_hotels do |t|
      t.integer :promo_id
      t.integer :hotel_id

      t.timestamps
    end
  end
end
