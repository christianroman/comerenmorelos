class FixStatusId < ActiveRecord::Migration
  def change
      rename_column :reservations, :status_id, :status
  end
end
