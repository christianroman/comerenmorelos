class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :redirect_to_subdomain_page

  private
  def load_hotel
    @hotel = Hotel.find_by_slug!(request.subdomain)
  end

  helper_method :background_images

  def background_images
    Setting.first.assets
  end

  def redirect_to_subdomain_page
    subdomains = request.subdomains
    if subdomains.length > 1
      redirect_to request.url.gsub('www.', '')
    end
  end

end
