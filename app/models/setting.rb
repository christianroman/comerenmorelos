class Setting < ActiveRecord::Base
  attr_accessible :id, :assets_attributes
  
  has_many :assets
  accepts_nested_attributes_for :assets, :reject_if => lambda {|t| t['data'].nil?}, :allow_destroy => true
end
