class Guest < ActiveRecord::Base
  attr_accessible :name, :email, :phone, :restaurant_id
  has_one :reservation
  has_one :contact
  #has_one :restaurant, :through => :reservation
  belongs_to :restaurant

  #validations
  validates :name, :presence => true, :length => { :minimum => 2 }
  validates :email, :presence => true
  validates :phone, :presence => true

  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

end
