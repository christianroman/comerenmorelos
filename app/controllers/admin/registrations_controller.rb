module Admin
    class RegistrationsController < Devise::RegistrationsController
	layout 'admin'

	def after_sign_up_path_for(resource)
	    admin_hotels_path
	end

	def new
	    super
	end

	def create
	    super
	end

	def edit
	    super
	end

	def update
	    super
	end

	def destroy
	    super
	end

    end
end
