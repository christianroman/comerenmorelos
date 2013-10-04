class RemoveUserIdFromHotels < ActiveRecord::Migration
  def up
    remove_column :hotels, :user_id
  end

  def down
    add_column :hotels, :user_id, :integer
  end
end
