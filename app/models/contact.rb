class Contact < ActiveRecord::Base
    attr_accessible :check_in, :check_out, :guest_id, :room_id, :comment, :adults, :children, :hotel_id
    belongs_to :hotel
    belongs_to :guest
    belongs_to :room

    #validations

    #validates :room, :presence => true
    validates :hotel, :presence => true
    validates :guest, :presence => true

    validates :check_in, :presence => true#, :date => { :after => Time.now, :before => Time.now + 1.year }
    validates :check_out, :presence => true#, :date => { :after => Time.now, :before => Time.now + 1.year }

    validates :adults, :presence => true, :numericality => {:greater_than => 0, :message => " no valido."}
    validates :children, :presence => true, :numericality => {:greater_than_or_equal_to => 0, :message => " no valido."}

end
