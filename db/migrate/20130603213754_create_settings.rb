class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.integer :id

      t.timestamps
    end
  end
end
