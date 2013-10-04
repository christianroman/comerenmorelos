module Api
  class RestaurantsController < ApplicationController

    def index
      @restaurants = Restaurant.search(params[:destinations], params[:fares], params[:categories], params[:promos])
      @status = @restaurants.blank? ? "NO_RESULTS" : "OK"
      self.response.headers["Content-Type"] = "application/json; charset=UTF-8"
    end

    def create

      @guest = Guest.new(name: params[:name], email: params[:email], phone: params[:phone], restaurant_id: params[:restaurant_id])

      respond_to do |format|

        if @guest.valid?

          if @guest.save

            @contact = Contact.new(room_id: params[:room_id].blank? ? nil : params[:room_id] == 0 ? nil : params[:room_id], guest_id: @guest.id, check_in: params[:check_in], check_out: params[:check_out], adults: params[:adults], children: params[:children], comment: params[:comment], restaurant_id: params[:restaurant_id])

            if @contact.valid?

              if @contact.save

                if Rails.env.production?
                  ActionMailer::Base.mail(:from => 'turestaurantenmorelos@gmail.com', :to => Restaurant.find(params[:restaurant_id]).email, :subject => 'Nueva solicitud de informacion', :body => 'Se ha realizado una nueva solicitud de informacion a traves del portal. Favor de revisar').deliver
                end

                format.json { render :json => { :status => 'OK' }, status: :created }

              end

            else

              @guest.destroy
              @errors = @contact.errors.full_messages
              format.json { render :json => @errors }

            end

          end

        else

          @errors = @guest.errors.full_messages
          format.json { render :json => @errors }

        end

      end

    end

  end

end
