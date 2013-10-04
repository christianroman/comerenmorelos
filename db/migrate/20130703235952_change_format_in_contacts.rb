class ChangeFormatInContacts < ActiveRecord::Migration
  def change
      change_column :contacts, :check_in, :date
      change_column :contacts, :check_out, :date
  end
end
