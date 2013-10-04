class PagesController < ApplicationController

    def show
	@page = Page.find(params[:id])
	respond_to do |format|
	    format.html
	end
    end

end
