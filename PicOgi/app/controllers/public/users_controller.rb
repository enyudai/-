class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @profile_image = @user.profile_image
  end

  def index
    @subjects = Subject.where(user_id: current_user.id).includes(:user).order("created_at DESC")
  end

  def edit
  end

  def update
  end
end
