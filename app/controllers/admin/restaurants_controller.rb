module Admin
  class RestaurantsController < BaseController
    load_and_authorize_resource
    # GET /restaurants
    # GET /restaurants.json
    def index

      unless @current_restaurant.nil?
        redirect_to admin_restaurant_path(@current_restaurant)
      else

        #@restaurants = Restaurant.all
        @restaurants = Restaurant.order('name ASC').page(params[:page]).per(20)

        @total_restaurants = Restaurant.count
        @total_active_restaurants = Restaurant.where(active: 1).count
        @total_inactive_restaurants = Restaurant.where(active: 0).count

        respond_to do |format|
          format.html # index.html.erb
        end
      end
    end

    # GET /restaurants/1
    # GET /restaurants/1.json
    def show
      @restaurant = Restaurant.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
      end
    end

    # GET /restaurants/new
    # GET /restaurants/new.json
    def new
      @restaurant = Restaurant.new
      6.times {@restaurant.photos.build}

      respond_to do |format|
        format.html # new.html.erb
      end
    end

    # GET /restaurants/1/edit
    def edit
      @restaurant = Restaurant.find(params[:id])
      (6 - @restaurant.photos.length).times { @restaurant.photos.build }
    end

    # POST /restaurants
    # POST /restaurants.json
    def create
      @restaurant = Restaurant.new(params[:restaurant])

      respond_to do |format|
        if @restaurant.save
          format.html { redirect_to [:admin, @restaurant], notice: 'Restaurant creado exitosamente.' }
        else
          format.html { render action: "new" }
        end
      end
    end

    # PUT /restaurants/1
    # PUT /restaurants/1.json
    def update
      @restaurant = Restaurant.find(params[:id])

      respond_to do |format|
        if @restaurant.update_attributes(params[:restaurant])
          format.html { redirect_to [:admin, @restaurant], notice: 'Restaurant actualizado exitosamente.' }
        else
          format.html { render action: "edit" }
        end
      end
    end

    # DELETE /restaurants/1
    # DELETE /restaurants/1.json
    def destroy
      @restaurant = Restaurant.find(params[:id])
      @restaurant.destroy

      respond_to do |format|
        format.html { redirect_to admin_restaurants_url, notice: 'Restaurant eliminado exitosamente.' }
      end
    end
  end
end
