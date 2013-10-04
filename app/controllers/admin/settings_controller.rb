module Admin
    class SettingsController < BaseController
	load_and_authorize_resource

	# GET /settings/1
	# GET /settings/1.json
	def show
	    @setting = Setting.first

	    respond_to do |format|
		format.html # show.html.erb
	    end
	end

	# GET /settings/1/edit
	def edit
	    @setting = Setting.first
	    (5 - @setting.assets.length).times { @setting.assets.build }
	end

	# PUT /settings/1
	# PUT /settings/1.json
	def update
	    @setting = Setting.first

	    respond_to do |format|
		if @setting.update_attributes(params[:setting])
		    format.html { redirect_to edit_admin_setting_path, notice: 'Ajustes actualizados exitosamente.' }
		else
		    format.html { render action: "edit" }
		end
	    end
	end

    end
end
