class SearchController < ApplicationController

    def index
	if params
	    @hotels = Hotel.search(params[:destinations], params[:fares], params[:categories], params[:promos])
	end
    end

end
