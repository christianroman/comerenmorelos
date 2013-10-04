class CreateRoomFares < ActiveRecord::Migration
  def change
    create_table :room_fares do |t|
      t.integer :room_id
      t.decimal :fare
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
