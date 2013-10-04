class Promo < ActiveRecord::Base
  attr_accessible :title
  has_many :hotels_promos
  has_many :hotels, :through => :hotels_promos
end
