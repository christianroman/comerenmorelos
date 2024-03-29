class CreateRooms < ActiveRecord::Migration
  def self.up
    create_table :rooms do |t|
      t.integer :hotel_id
      t.string :name
      t.decimal :rate
      t.integer :existence
      t.integer :available
      t.timestamps
    end
  end

  def self.down
    drop_table :rooms
  end
end
