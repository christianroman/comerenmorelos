class Contact < ActiveRecord::Base
  attr_accessible :check_in, :guest_id, :comment, :adults, :restaurant_id
  belongs_to :restaurant
  belongs_to :guest

  #validations

  validates :restaurant, :presence => true
  validates :guest, :presence => true

  validates :check_in, :presence => true#, :date => { :after => Time.now, :before => Time.now + 1.year }

  validates :adults, :presence => true, :numericality => {:greater_than => 0, :message => " no valido."}

end
