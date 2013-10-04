class AddCommentToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :comment, :text
  end
end
