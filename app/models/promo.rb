class Promo < ActiveRecord::Base
  attr_accessible :title
  has_many :restaurants_promos
  has_many :restaurants, :through => :restaurants_promos
end
