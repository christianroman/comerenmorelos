class AddActiveToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :active, :boolean, {:default => true, :null => false}
  end
end
