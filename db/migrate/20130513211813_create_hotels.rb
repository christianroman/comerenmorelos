class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.integer :id
      t.integer :user_id
      t.string :name
      t.string :street
      t.string :district
      t.string :zipcode
      t.integer :destination_id
      t.string :phone
      t.string :website
      t.string :email
      t.integer :fare_id
      t.string :image
      t.string :video
      t.string :paypal

      t.timestamps
    end
  end
end
