module Admin
    class RoomsController < BaseController
	load_and_authorize_resource

	def index

	    unless @current_hotel.nil?
		@rooms = @current_hotel.rooms
	    else
		@rooms = Room.all
	    end
	end

	def show
	    @room = Room.find(params[:id])
	end

	def new
	    @room = Room.new
	end

	def create
	    @room = Room.new(params[:room])
	    if @room.save
		redirect_to [:admin, @room], :notice => "Habitacion creada exitosamente."
	    else
		render :action => 'new'
	    end
	end

	def edit
	    @room = Room.find(params[:id])
	end

	def update
	    @room = Room.find(params[:id])
	    if @room.update_attributes(params[:room])
		redirect_to [:admin, @room], :notice  => "Habitacion actualizada exitosamente."
	    else
		render :action => 'edit'
	    end
	end

	def destroy
	    @room = Room.find(params[:id])
	    @room.destroy
	    redirect_to admin_rooms_url, :notice => "Habitacion eliminada exitosamente."
	end
    end
end
