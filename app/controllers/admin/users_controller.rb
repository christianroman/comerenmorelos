module Admin
    class UsersController < BaseController
	load_and_authorize_resource

	def new
	    @user = User.new

	    respond_to do |format|
		format.html
	    end
	end

	def create
	    @user = User.new(params[:user])

	    respond_to do |format|
		if @user.save
		    format.html { redirect_to admin_users_path, notice: 'Usuario creado exitosamente' }
		else
		    format.html { render action: 'new' }
		end
	    end
	end

	def update
	    @user = User.find(params[:id])

	    if params[:user][:password].blank?
		params[:user].delete(:password)
		params[:user].delete(:password_confirmation)
	    end

	    respond_to do |format|
		if @user.update_attributes(params[:user])
		    format.html { redirect_to admin_users_path, notice: 'Usuario actualizado exitosamente' }
		else
		    format.html { render action: 'edit' }
		end
	    end
	end

	def edit
	    @user = User.find(params[:id])
	end

	def destroy
	    @user = User.find(params[:id])
	    @user.destroy

	    respond_to do |format|
		format.html { redirect_to admin_users_url, notice: 'Usuario eliminado exitosamente.' }
	    end
	end

	def index
	    #@users = User.accessible_by(current_ability, :index).limit(20)
	    @users = User.all
	    respond_to do |format|
		format.html
	    end
	end

	def show
	    @user = User.find(params[:id])

	    respond_to do |format|
		format.html 
	    end
	end
    end
end
