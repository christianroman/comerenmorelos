class AddSlugToHotel < ActiveRecord::Migration
  def change
    add_column :hotels, :slug, :string
  end
end
