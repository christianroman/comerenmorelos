class RemoveMaxChildrenFromRooms < ActiveRecord::Migration
  def up
    remove_column :rooms, :max_children
  end

  def down
    add_column :rooms, :max_children, :integer
  end
end
