class ChangeDataTypeForRooms < ActiveRecord::Migration
    def change
	rename_column :rooms, :max_persons, :max_adults
    end
end
