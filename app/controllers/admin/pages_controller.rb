module Admin
    class PagesController < BaseController
	# GET /pages
	# GET /pages.json
	def index
	    @pages = Page.all

	    respond_to do |format|
		format.html # index.html.erb
		format.json { render json: @pages }
	    end
	end

	# GET /pages/1
	# GET /pages/1.json
	def show
	    @page = Page.find(params[:id])

	    respond_to do |format|
		format.html # show.html.erb
	    end
	end

	# GET /pages/new
	# GET /pages/new.json
	def new
	    @page = Page.new

	    respond_to do |format|
		format.html # new.html.erb
	    end
	end

	# GET /pages/1/edit
	def edit
	    @page = Page.find(params[:id])
	end

	# POST /pages
	# POST /pages.json
	def create
	    @page = Page.new(params[:page])

	    respond_to do |format|
		if @page.save
		    format.html { redirect_to [:admin, @page], notice: 'Pagina creada exitosamente.' }
		else
		    format.html { render action: "new" }
		end
	    end
	end

	# PUT /pages/1
	# PUT /pages/1.json
	def update
	    @page = Page.find(params[:id])

	    respond_to do |format|
		if @page.update_attributes(params[:page])
		    format.html { redirect_to [:admin, @page], notice: 'Pagina actualizada exitosamente.' }
		else
		    format.html { render action: "edit" }
		end
	    end
	end

	# DELETE /pages/1
	# DELETE /pages/1.json
	def destroy
	    @page = Page.find(params[:id])
	    @page.destroy

	    respond_to do |format|
		format.html { redirect_to admin_pages_url, notice: 'Pagina eliminada exitosamente.' }
	    end
	end
    end
end
