class RemoveImageFromHotels < ActiveRecord::Migration
  def up
    remove_column :hotels, :image
  end

  def down
    add_column :hotels, :image, :string
  end
end
