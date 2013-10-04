class RoomFare < ActiveRecord::Base
  attr_accessible :end_date, :fare, :room_id, :start_date
  belongs_to :room
end
