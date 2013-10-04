class Availability < ActiveRecord::Base
  attr_accessible :end_date, :hotel_id, :start_date

  belongs_to :hotel

  validates :hotel, :presence => true

  validates :start_date, :presence => true
  validates :end_date, :presence => true

end
