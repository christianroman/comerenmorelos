module Admin
    class SessionsController < Devise::SessionsController
	layout 'admin'
	
	def after_sign_in_path_for(resource)
	    admin_hotels_path
	end

	def after_sign_out_path_for(resource_or_scope)
	    new_admin_user_session_path
	end

	def new
	    super
	end

	def create
	    super
	end

	def destroy
	    super
	end

    end
end
