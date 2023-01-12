class Public::UserSubjectAnswerFavoritesController < ApplicationController
  def create
    @subject = Subject.find(params[:subject_id])
    @user_subject_answer = UserSubjectAnswer.find(params[:user_subject_answer_id])
    favorite = @user_subject_answer.user_subject_answer_favorites.new(user_id: current_user.id)
    favorite.save
    # app/views/public/user_subject_answer_favorites/create.js.erbを参照する
  end
  
  def destroy
    @subject = Subject.find(params[:subject_id])
    @user_subject_answer = UserSubjectAnswer.find(params[:user_subject_answer_id])
    favorite = @user_subject_answer.user_subject_answer_favorites.find_by(user_id: current_user.id)
    favorite.destroy
    # app/views/public/user_subject_answer_favorites/destroy.js.erbを参照する
  end
end
