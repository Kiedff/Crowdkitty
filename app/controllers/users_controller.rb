class UsersController < ApplicationController
  
 load_and_authorize_resource


 def index
   @users = User.all
 end

 def show
   @user = User.find(params[:id])
 end

 def edit
   @user = current_user
 end

 def update
  user = User.find(params[:id])
  user.update(user_params)
  redirect_to(user)
 end
    private
    def user_params
      params.require(:user).permit(:name, :address1, :address2, :email, :username, :last_name, :city, :postcode, :user_image)
    end
  end

