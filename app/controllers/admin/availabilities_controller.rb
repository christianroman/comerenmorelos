module Admin
    class AvailabilitiesController < BaseController
	load_and_authorize_resource
	# GET /availabilitys
	# GET /availabilitys.json
	def index

	    unless @current_hotel.nil?
		@availabilities = @current_hotel.availabilities
	    else
		@availabilities = Availability.all
		respond_to do |format|
		    format.html # index.html.erb
		end
	    end
	end

	# GET /availabilitys/1
	# GET /availabilitys/1.json
	def show
	    @availability = Availability.find(params[:id])

	    respond_to do |format|
		format.html # show.html.erb
	    end
	end

	# GET /availabilitys/new
	# GET /availabilitys/new.json
	def new
	    @availability = Availability.new

	    respond_to do |format|
		format.html # new.html.erb
	    end
	end

	# GET /availabilitys/1/edit
	def edit
	    @availability = Availability.find(params[:id])
	end

	# POST /availabilitys
	# POST /availabilitys.json
	def create
	    @availability = Availability.new(params[:availability])

	    respond_to do |format|
		if @availability.save
		    format.html { redirect_to [:admin, @availability], notice: 'Fecha creada exitosamente.' }
		else
		    format.html { render action: "new" }
		end
	    end
	end

	# PUT /availabilitys/1
	# PUT /availabilitys/1.json
	def update
	    @availability = Availability.find(params[:id])

	    respond_to do |format|
		if @availability.update_attributes(params[:availability])
		    format.html { redirect_to [:admin, @availability], notice: 'Fecha actualizada exitosamente.' }
		else
		    format.html { render action: "edit" }
		end
	    end
	end

	# DELETE /availabilitys/1
	# DELETE /availabilitys/1.json
	def destroy
	    @availability = Availability.find(params[:id])
	    @availability.destroy

	    respond_to do |format|
		format.html { redirect_to admin_availabilities_url, notice: 'Fecha eliminada exitosamente.' }
	    end
	end
    end
end
