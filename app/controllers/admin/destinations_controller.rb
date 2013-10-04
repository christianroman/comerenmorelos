module Admin
    class DestinationsController < BaseController
	load_and_authorize_resource
	# GET /destinations
	# GET /destinations.json
	def index
	    @destinations = Destination.all

	    respond_to do |format|
		format.html # index.html.erb
		format.json { render json: @destinations }
	    end
	end

	# GET /destinations/1
	# GET /destinations/1.json
	def show
	    @destination = Destination.find(params[:id])

	    respond_to do |format|
		format.html # show.html.erb
		format.json { render json: @destination }
	    end
	end

	# GET /destinations/new
	# GET /destinations/new.json
	def new
	    @destination = Destination.new

	    respond_to do |format|
		format.html # new.html.erb
		format.json { render json: @destination }
	    end
	end

	# GET /destinations/1/edit
	def edit
	    @destination = Destination.find(params[:id])
	end

	# POST /destinations
	# POST /destinations.json
	def create
	    @destination = Destination.new(params[:destination])

	    respond_to do |format|
		if @destination.save
		    format.html { redirect_to [:admin, @destination], notice: 'Destino agregado exitosamente.' }
		else
		    format.html { render action: "new" }
		end
	    end
	end

	# PUT /destinations/1
	# PUT /destinations/1.json
	def update
	    @destination = Destination.find(params[:id])

	    respond_to do |format|
		if @destination.update_attributes(params[:destination])
		    format.html { redirect_to [:admin, @destination], notice: 'Destino actualizado exitosamente.' }
		else
		    format.html { render action: "edit" }
		end
	    end
	end

	# DELETE /destinations/1
	# DELETE /destinations/1.json
	def destroy
	    @destination = Destination.find(params[:id])
	    @destination.destroy

	    respond_to do |format|
		format.html { redirect_to admin_destinations_url, notice: 'Destino eliminado exitosamente.' }
	    end
	end
    end
end
