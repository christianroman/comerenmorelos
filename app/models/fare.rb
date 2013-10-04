class Fare < ActiveRecord::Base
  attr_accessible :end, :id, :name, :start
  has_many :hotels
end
