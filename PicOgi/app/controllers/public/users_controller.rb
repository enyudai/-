class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @profile_image = @user.profile_image
    @subjects = Subject.where(status: true)
    @subject = @subjects.where(user_id: current_user.id)
  end

  def index
   
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:nickname, :email, :profile_image, :introduction)
  end
  
end
