class RestaurantsController < ApplicationController

  def index
    @restaurant = @current_restaurant
  end

  def show

    #@restaurant = Restaurant.find(params[:id])
    #@restaurant = Restaurant.find_by_slug!(request.subdomain)
    respond_to do |format|
      format.html {

        @restaurant = Restaurant.find_by_slug!(request.subdomain)

        @dates = Array.new
        @restaurant.availabilities.each do |range|
          @dates |= (range.start_date..range.end_date).map{ |date| date.strftime('%d/%m/%Y') }
        end		

      }
      format.js {

        @restaurant = Restaurant.find(params[:id])
        @dates = Array.new
        @restaurant.availabilities.each do |range|
          @dates |= (range.start_date..range.end_date).map{ |date| date.strftime('%d/%m/%Y') }
        end

      }
    end
  end

  def create

    @guest = Guest.new(name: params[:nombre], email: params[:email], phone: params[:telefono], restaurant_id: params[:id])

    respond_to do |format|

      if @guest.valid?
        if @guest.save

          @contact = Contact.new(guest_id:@guest.id, check_in: params[:check_in], adults: params[:adults], comment: params[:comentario], restaurant_id: params[:id])

          if @contact.valid?

            if @contact.save

              if Rails.env.production?
                ActionMailer::Base.mail(:from => "comerenmorelos@gmail.com", :to => Restaurant.find(params[:id]).email, :subject => "Nueva solicitud de informacion", :body => "Se ha realizado una nueva solicitud de informacion a traves del portal. Favor de revisar").deliver
              end

              format.json { render :json => {:success => true} }

            end

          else

            @guest.destroy
            @errors = @contact.errors.full_messages
            format.json {render :json => @errors}

          end

        end

      else

        @errors = @guest.errors.full_messages
        format.json { render :json => @errors }

      end

    end

  end

end
