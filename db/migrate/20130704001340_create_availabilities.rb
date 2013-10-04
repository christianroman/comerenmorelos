class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.integer :hotel_id
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
