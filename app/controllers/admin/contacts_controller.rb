module Admin
    class ContactsController < BaseController
	load_and_authorize_resource
	# GET /contacts
	# GET /contacts.json
	def index

	    unless @current_hotel.nil?
		#@contacts = @current_hotel.contacts
		@contacts = Contact.where(hotel_id: @current_hotel.id)
	    else
		@contacts = Contact.all
		respond_to do |format|
		    format.html # index.html.erb
		end
	    end
	end

	# GET /contacts/1
	# GET /contacts/1.json
	def show
	    @contact = Contact.find(params[:id])

	    respond_to do |format|
		format.html # show.html.erb
	    end
	end

	# GET /contacts/new
	# GET /contacts/new.json
	def new
	    @contact = Contact.new

	    respond_to do |format|
		format.html # new.html.erb
	    end
	end

	# GET /contacts/1/edit
	def edit
	    @contact = Contact.find(params[:id])
	end

	# POST /contacts
	# POST /contacts.json
	def create
	    @contact = Contact.new(params[:contact])

	    respond_to do |format|
		if @contact.save
		    format.html { redirect_to [:admin, @contact], notice: 'Contacto creado exitosamente.' }
		else
		    format.html { render action: "new" }
		end
	    end
	end

	# PUT /contacts/1
	# PUT /contacts/1.json
	def update
	    @contact = Contact.find(params[:id])

	    respond_to do |format|
		if @contact.update_attributes(params[:contact])
		    format.html { redirect_to [:admin, @contact], notice: 'Contacto actualizado exitosamente.' }
		else
		    format.html { render action: "edit" }
		end
	    end
	end

	# DELETE /contacts/1
	# DELETE /contacts/1.json
	def destroy
	    @contact = Contact.find(params[:id])
	    @contact.destroy

	    respond_to do |format|
		format.html { redirect_to admin_contacts_url, notice: 'Contacto eliminado exitosamente.' }
	    end
	end
    end
end
