class Public::AnswersController < ApplicationController
  def create
    # binding.pry
    @subject = Subject.find(params[:subject_id])
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id
    @answer.subject_id = @subject.id
    @answer.save
  end
   # unless @answer.save
    #render 'error'  # app/views/public/user_subject_answers/error.js.erbを参照する ※要件外
    # app/views/public/user_subject_answers/create.js.erbを参照する
  #end
  
  def destroy
    @subject = Subject.find(params[:subject_id])
    answer = @subject.answers.find(params[:id])
    answer.destroy
    # app/views/public/user_subject_answers/destroy.js.erbを参照する
  end
  
  private
  
  def answer_params
    params.require(:answer).permit(:answer)
  end
  
end
