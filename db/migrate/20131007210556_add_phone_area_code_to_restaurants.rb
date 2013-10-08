class AddPhoneAreaCodeToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :phone_area_code, :string
  end
end
