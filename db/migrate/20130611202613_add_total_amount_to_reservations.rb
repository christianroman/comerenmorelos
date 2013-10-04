class AddTotalAmountToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :total_amount, :decimal
  end
end
