class AddChildrenToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :children, :integer
  end
end
