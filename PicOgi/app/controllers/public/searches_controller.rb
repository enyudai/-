class Public::SearchesController < ApplicationController
  
  
  def index
    # @user_flag = false
    # @subject_flag = false
    # @answer_flag = false
    
    # if params[:models] == "ユーザー名"
    #   @user_flag = true
      @users = User.search(params[:keyword])
    #
  
    # if params[:models] == "お題名"
    #   @subject_flag = true
    #   @subjects = Subject.search(params[:keyword])
    # end
    
    # if params[:models] == "回答"
    #   @answer_flag = true
    #   @answers = Answer.search(params[:keyword])
    # end
    
  end
  

  
end
