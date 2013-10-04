class Destination < ActiveRecord::Base
  attr_accessible :id, :name
  has_many :hotels
end
