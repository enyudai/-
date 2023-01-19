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
  end
  
  def edit
  end 
  
  private
  
end
