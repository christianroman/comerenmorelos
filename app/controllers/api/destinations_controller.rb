module Api
    class DestinationsController < ApplicationController

	def index
	    @destinations = Destination.all
	    @status = @destinations.blank? ? 'NO_RESULTS' : 'OK'
	    self.response.headers["Content-Type"] = "application/json; charset=UTF-8"
	end

    end
end
