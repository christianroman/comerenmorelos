module Api
    class FaresController < ApplicationController

	def index
	    @fares = Fare.all
	    @status = @fares.blank? ? 'NO_RESULTS' : 'OK'
	    self.response.headers["Content-Type"] = "application/json; charset=UTF-8"
	end

    end
end
