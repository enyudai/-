class Public::SearchesController < ApplicationController
  
  
  def index
    @user_flag = false
    @subject_flag = false
    
    if params[:models] == "User"
      @user_flag = true
      @users = User.search(params[:keyword])
    end
    #byebug
    if params[:models] == "Subject"
      @subject_flag = true
      @subjects = Subject.search(params[:keyword])
    end
    
  end
  

  
end
