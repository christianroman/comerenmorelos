class RenameHotelsToRestaurants < ActiveRecord::Migration
  def change
    rename_table :hotels, :restaurants
  end
end
