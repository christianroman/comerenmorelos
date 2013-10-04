module Admin
  class BaseController < ApplicationController
    layout 'admin'
    before_filter :authenticate_admin_user!
    before_filter :initialize_restaurant

    def current_ability
      @current_ability ||= Ability.new(current_admin_user)
    end

    private
    def initialize_restaurant
      if current_admin_user.role?(:restaurant_admin) || current_admin_user.role?(:restaurant_staff)
        @current_restaurant = current_admin_user.restaurant
      end
    end

    rescue_from CanCan::AccessDenied do |exception|
      redirect_to admin_restaurants_url, :alert => exception.message
    end

  end
end
