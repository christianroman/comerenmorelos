class AddPurchasedAtToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :purchased_at, :date
  end
end
