module Api
    class HomeController < ApplicationController

	def index

	    @categories = Category.all
	    @destinations = Destination.all
	    @fares = Fare.all
	    
	    @status = @categories.blank? && @destinations.blank? && @fares.blank? ? 'NO_RESULTS' : 'OK'
	    self.response.headers["Content-Type"] = "application/json; charset=UTF-8"

	end

    end
end
