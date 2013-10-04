module Admin
    class GuestsController < BaseController
	load_and_authorize_resource

	def index
	    
	    unless @current_hotel.nil?
		@guests = @current_hotel.guests
	    else
		@guests = Guest.all
	    end
	    
	    respond_to do |format|
		format.html
	    end

	end

	def show
	    @guest = Guest.find(params[:id])
	end

	def new
	    @guest = Guest.new
	end

	def create
	    @guest = Guest.new(params[:guest])
	    if @guest.save
		redirect_to [:admin, @guest], :notice => "Cliente creado exitosamente."
	    else
		render :action => 'new'
	    end
	end

	def edit
	    @guest = Guest.find(params[:id])
	end

	def update
	    @guest = Guest.find(params[:id])
	    if @guest.update_attributes(params[:guest])
		redirect_to [:admin, @guest], :notice  => "Cliente actualizado exitosamente."
	    else
		render :action => 'edit'
	    end
	end

	def destroy
	    @guest = Guest.find(params[:id])
	    @guest.destroy
	    redirect_to admin_guests_url, :notice => "Cliente eliminado exitosamente."
	end
    end
end
