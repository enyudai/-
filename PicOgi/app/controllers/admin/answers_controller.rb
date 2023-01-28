class Admin::AnswersController < ApplicationController
  #adminコントローラーを作成するた度、以下の記述
  skip_before_action :authenticate_user!
  before_action :authenticate_admin!
  
    def destroy
      subject = Subject.find(params[:subject_id])
      answer = Answer.find(params[:id])
      answer.destroy
      redirect_to admin_subject_path(subject)
    end
    
end
