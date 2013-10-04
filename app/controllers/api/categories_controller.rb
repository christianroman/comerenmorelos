module Api
  class CategoriesController < ApplicationController

    def index
      @categories = Category.all
      @status = @categories.blank? ? 'NO_RESULTS' : 'OK'
      self.response.headers["Content-Type"] = "application/json; charset=UTF-8"
    end

  end
end
