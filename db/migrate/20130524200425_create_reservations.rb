class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :room_id
      t.integer :guest_id
      t.date :check_in
      t.date :check_out
      t.integer :status_id

      t.timestamps
    end
  end
end
