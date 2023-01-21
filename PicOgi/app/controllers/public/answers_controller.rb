class Public::AnswersController < ApplicationController
  def create
    @subject = Subject.find(params[:subject_id])
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id
    @answer.subject_id = @subject.id
    @answer.save
  end
  
  def destroy
    @subject = Subject.find(params[:subject_id])
    answer = @subject.answers.find(params[:id])
    answer.destroy
  end
  
   def search
    @answers = Answer.search(params[:keyword])
   end
  
  private
  
  def answer_params
    params.require(:answer).permit(:answer)
  end
  
end
