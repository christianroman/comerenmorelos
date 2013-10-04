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

          check_in_date = params[:check_in].to_time
          check_out_date = params[:check_out].to_time
          days = ((check_out_date - check_in_date) / 1.day).to_i

          if params[:commit] == 'Reserva ya'

            unless params[:room][:room_id].empty?

              total_amount = days * Room.find(params[:room][:room_id]).fare

              @reservation = Reservation.new(room_id: params[:room][:room_id], guest_id:@guest.id, check_in: params[:check_in], check_out: params[:check_out], adults: params[:adults], children: params[:children], comment: params[:comentario], restaurant_id: params[:id], status:0, total_amount:total_amount)

              if @reservation.valid?
                if @reservation.save

                  if Rails.env.production?
                    ActionMailer::Base.mail(:from => "turestaurantenmorelos@gmail.com", :to => Restaurant.find(params[:id]).email, :subject => "Nueva reservacion", :body => "Se ha realizado una nueva reservacion a traves del portal. Favor de revisar").deliver
                  end

                  return_url = root_url

                  values = {
                    :business => @reservation.restaurant.paypal,
                    :cmd => '_xclick',
                    :upload => 1,
                    :currency_code => 'MXN',
                    :return => return_url,
                    :invoice => @reservation.id,
                    :notify_url => payment_notifications_url,
                    :amount => @reservation.total_amount,
                    :item_name => "#{days} noches en #{@reservation.restaurant.name}".encode,
                    :item_number => @reservation.restaurant.id,
                    :quantity => 1
                  }

                  format.json{ render :json => { :location => "https://www.sandbox.paypal.com/cgi-bin/webscr?#{values.to_query}" } }
                  #return

                end
              else

                @guest.destroy

                @errors = @reservation.errors.full_messages
                format.json { render :json => @errors }

              end

            else
              @errors = ["Habitaci&oacute;n no seleccionada"]
              @guest.destroy
              format.json { render :json => @errors }
            end

          else

            unless params[:room].blank?

              unless params[:room][:room_id].empty?

                @contact = Contact.new(room_id: params[:room][:room_id], guest_id:@guest.id, check_in: params[:check_in], check_out: params[:check_out], adults: params[:adults], children: params[:children], comment: params[:comentario], restaurant_id: params[:id])

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

              else

                @errors = ['Habitaci&oacute;n no seleccionada']
                @guest.destroy
                format.json { render :json => @errors }

              end

            else

              @contact = Contact.new(room_id: nil, guest_id:@guest.id, check_in: params[:check_in], check_out: params[:check_out], adults: params[:adults], children: params[:children], comment: params[:comentario], restaurant_id: params[:id])

              if @contact.valid?

                if @contact.save

                  format.json {render :json => {:success => true}}

                end

              else

                @guest.destroy

                @errors = @contact.errors.full_messages
                format.json {render :json => @errors}

              end

            end

          end

        end
      else

        @errors = @guest.errors.full_messages
        format.json { render :json => @errors }

      end

    end

  end

end
