module Admin
    class BaseController < ApplicationController
	layout 'admin'
	before_filter :authenticate_admin_user!
	before_filter :initialize_hotel

	def current_ability
	    @current_ability ||= Ability.new(current_admin_user)
	end

	private
	def initialize_hotel
	    if current_admin_user.role?(:hotel_admin) || current_admin_user.role?(:hotel_staff)
		@current_hotel = current_admin_user.hotel
	    end
	end

	rescue_from CanCan::AccessDenied do |exception|
	    redirect_to admin_hotels_url, :alert => exception.message
	end

    end
end
