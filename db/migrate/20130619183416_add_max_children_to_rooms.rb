class AddMaxChildrenToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :max_children, :integer
  end
end
