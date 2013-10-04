class FixFare < ActiveRecord::Migration
  def change
      rename_column :rooms, :rate, :fare
  end
end
