class RemoveCheckOutFromContacts < ActiveRecord::Migration
  def change
    remove_column :contacts, :check_out
    remove_column :contacts, :children
    remove_column :contacts, :room_id
  end
end
