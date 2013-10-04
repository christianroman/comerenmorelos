class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.integer :hotel_id
      t.integer :category_id

      t.timestamps
    end
  end
end
