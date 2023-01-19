class Admin::UsersController < ApplicationController
    #adminコントローラーを作成するた度、以下の記述
  skip_before_action :authenticate_user!
  before_action :authenticate_admin!
  
  def index
     @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @subjects = @user.subjects.where(status: true)
  end
  
  def update
       @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path
    else
      render :edit
    end
  end
  
  def edit
    @user = User.find(params[:id])
    @subjects = @user.subjects.where(status: true)
  end 
  
  private
  
   def user_params
    params.require(:user).permit(:nickname, :email, :profile_image, :introduction, :is_deleted)
   end
  
end
