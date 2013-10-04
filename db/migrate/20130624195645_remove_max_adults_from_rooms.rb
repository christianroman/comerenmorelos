class RemoveMaxAdultsFromRooms < ActiveRecord::Migration
  def up
    remove_column :rooms, :max_adults
  end

  def down
    add_column :rooms, :max_adults, :integer
  end
end
