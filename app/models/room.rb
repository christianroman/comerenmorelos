class Room < ActiveRecord::Base
    attr_accessible :hotel_id, :name, :fare, :existence, :available, :room_fares_attributes
    belongs_to :hotel
    has_many :reservations
    has_many :contacts
    has_many :room_fares
    accepts_nested_attributes_for :room_fares, allow_destroy: true, :reject_if => proc { |a| a['fare'].blank? }

    private
    def name_and_fare
	"#{name} - $#{fare}"
    end

end
