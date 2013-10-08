class HomeController < ApplicationController
  def index

    @destinations = Destination.find_all_by_id([7, 20, 6, 12, 29])
    @fares = Fare.all
    @categories = Category.all

  end
end
