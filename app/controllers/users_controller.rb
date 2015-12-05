class UsersController < ApplicationController

 load_and_authorize_resource

 def index
   @users = User.where(id: current_user.id)
 end

 def new
   @user = User.new
 end

 def create
   User.create(user_params)
   redirect_to(users_path)
 end

 def show
   @user = User.find(current_user.id)
 end

 def destroy
   user = User.find(params[:id])
   user.destroy
   redirect_to(users_path)
 end

 def update
   user = User.find(params[:id])
   user.update(user_params)
   redirect_to(users_path)
 end

 def edit
   @user= User.find(params[:id])
 end

 private

  def user_params
  params.require(:user).permit(:name, :address1, :address2, :email, :username, :last_name, :city, :postcode, :user_image)
  end

end

