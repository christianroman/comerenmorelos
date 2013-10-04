class SearchController < ApplicationController

  def index
    if params
      @restaurants = Restaurant.search(params[:destinations], params[:fares], params[:categories], params[:promos])
    end
  end

end
