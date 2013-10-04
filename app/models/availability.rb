class Availability < ActiveRecord::Base
  attr_accessible :end_date, :restaurant_id, :start_date

  belongs_to :restaurant

  validates :restaurant, :presence => true

  validates :start_date, :presence => true
  validates :end_date, :presence => true

end
