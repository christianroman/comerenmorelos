class PaymentNotification < ActiveRecord::Base
    attr_accessible :params, :reservation_id, :status, :transaction_id

    belongs_to :reservation
    serialize :params
    after_create :mark_reservation_as_purchased

    private

    def mark_reservation_as_purchased
	if status == "Completed"
	    reservation.update_attribute(:purchased_at, Time.now)
	    reservation.update_attribute(:status, 1)
	end
    end

end
