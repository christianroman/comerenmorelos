class ChangeDataTypeForReservations < ActiveRecord::Migration
  def change
      rename_column :reservations, :persons, :adults
  end
end
