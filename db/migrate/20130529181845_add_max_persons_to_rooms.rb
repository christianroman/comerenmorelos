class AddMaxPersonsToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :max_persons, :integer
  end
end
