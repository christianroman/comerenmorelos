class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :room_id
      t.integer :guest_id
      t.integer :check_in
      t.integer :check_out
      t.text :comment
      t.integer :adults
      t.integer :children
      t.integer :hotel_id

      t.timestamps
    end
  end
end
