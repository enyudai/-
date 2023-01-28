class Public::SearchesController < ApplicationController
  
  
  def index
    @users = User.search(params[:keyword]).page(params[:page]).per(10)
    
  end
  

  
end
