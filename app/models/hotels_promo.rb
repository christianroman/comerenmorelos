class HotelsPromo < ActiveRecord::Base
  attr_accessible :hotel_id, :promo_id
  belongs_to :hotel
  belongs_to :promo
end
