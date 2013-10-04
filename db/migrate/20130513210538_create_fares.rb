class CreateFares < ActiveRecord::Migration
  def change
    create_table :fares do |t|
      t.integer :id
      t.string :name
      t.integer :start
      t.integer :end

      t.timestamps
    end
  end
end
