class Admin::HomesController < ApplicationController
  #adminコントローラーを作成するた度、以下の記述
  skip_before_action :authenticate_user!
  before_action :authenticate_admin!
  
  def top
    @users = User.all
  end
end
