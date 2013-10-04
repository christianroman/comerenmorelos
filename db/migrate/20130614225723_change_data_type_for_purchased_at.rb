class ChangeDataTypeForPurchasedAt < ActiveRecord::Migration
    def change
	change_column :reservations, :purchased_at, :datetime
    end
end
