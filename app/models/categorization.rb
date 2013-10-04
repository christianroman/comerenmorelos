class Categorization < ActiveRecord::Base
  attr_accessible :category_id, :hotel_id
  belongs_to :hotel
  belongs_to :category
end
