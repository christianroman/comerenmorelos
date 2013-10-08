class AddServicesToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :services, :text
  end
end
