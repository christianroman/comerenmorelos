class HomeController < ApplicationController
    def index

	@destinations = Destination.all
	@fares = Fare.all
	@categories = Category.all

    end
end
