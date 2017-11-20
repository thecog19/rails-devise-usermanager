class UsersController < ApplicationController
	before_action :authorize_admin
	def index
		@users = User.all
	end

	def destroy
	    @user = User.find(params[:id])
	    @user.destroy

	    if @user.destroy
	    	flash[:success] = "User deleted"
	        redirect_to users_index_path
	    end
  	end

  	def new

  	end

  	def update
  		@user = User.where(id: params[:id]).first
  		if @user.update(user_params)
  			flash[:success] = "user updated"
  			redirect_to users_index_path
  		else
  			flash[:danger] = @user.errors.full_messages
    		redirect_to users_edit_path
  		end
  	end

  	def edit
  		@user = User.where(id: params[:id]).first
  	end

  	def create
    	@user = User.new(user_params)
    	if @user.save
    		redirect_to users_index_path
    	else
    		flash[:danger] = @user.errors.full_messages
    		redirect_to users_new_path
   		end
  	end

 	private

	# This should probably be abstracted to ApplicationController
	# as shown by diego.greyrobot
	def authorize_admin
		if current_user == nil
			flash[:danger] =  "You must be logged in" 
			redirect_to root_path
			return
		end
		return unless !current_user.admin?
		flash[:danger] =  'Admins only!'
		redirect_to root_path
	end

	def user_params
    	params.require(:user).permit(:username, :email, :password, :admin, :password_confirmation)
 	end
end
