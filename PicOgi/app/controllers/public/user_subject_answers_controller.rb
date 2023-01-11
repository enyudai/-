class Public::UserSubjectAnswersController < ApplicationController
  def create
    @subject = Subject.find(params[:subject_id])
    @answer = UserSubjectAnswer.new(user_subject_answer_params)
    @answer.user_id = current_user.id
    @answer.subject_id = @subject.id
    @answer.save
    redirect_to subject_path(@subject)
  end
  
  def destroy
  end
  
  private
  
  def user_subject_answer_params
    params.require(:user_subject_answer).permit(:answer)
  end
  
end
