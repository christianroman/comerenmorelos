module Admin
  class HotelsController < BaseController
    load_and_authorize_resource
    # GET /hotels
    # GET /hotels.json
    def index

      unless @current_hotel.nil?
        redirect_to admin_hotel_path(@current_hotel)
      else

        #@hotels = Hotel.all
        @hotels = Hotel.order('name ASC').page(params[:page]).per(20)

        @total_hotels = Hotel.count
        @total_active_hotels = Hotel.where(active: 1).count
        @total_inactive_hotels = Hotel.where(active: 0).count

        respond_to do |format|
          format.html # index.html.erb
        end
      end
    end

    # GET /hotels/1
    # GET /hotels/1.json
    def show
      @hotel = Hotel.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
      end
    end

    # GET /hotels/new
    # GET /hotels/new.json
    def new
      @hotel = Hotel.new
      6.times {@hotel.photos.build}

      respond_to do |format|
        format.html # new.html.erb
      end
    end

    # GET /hotels/1/edit
    def edit
      @hotel = Hotel.find(params[:id])
      (6 - @hotel.photos.length).times { @hotel.photos.build }
    end

    # POST /hotels
    # POST /hotels.json
    def create
      @hotel = Hotel.new(params[:hotel])

      respond_to do |format|
        if @hotel.save
          format.html { redirect_to [:admin, @hotel], notice: 'Hotel creado exitosamente.' }
        else
          format.html { render action: "new" }
        end
      end
    end

    # PUT /hotels/1
    # PUT /hotels/1.json
    def update
      @hotel = Hotel.find(params[:id])

      respond_to do |format|
        if @hotel.update_attributes(params[:hotel])
          format.html { redirect_to [:admin, @hotel], notice: 'Hotel actualizado exitosamente.' }
        else
          format.html { render action: "edit" }
        end
      end
    end

    # DELETE /hotels/1
    # DELETE /hotels/1.json
    def destroy
      @hotel = Hotel.find(params[:id])
      @hotel.destroy

      respond_to do |format|
        format.html { redirect_to admin_hotels_url, notice: 'Hotel eliminado exitosamente.' }
      end
    end
  end
end
