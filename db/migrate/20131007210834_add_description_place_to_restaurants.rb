class AddDescriptionPlaceToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :description_place, :text
  end
end
