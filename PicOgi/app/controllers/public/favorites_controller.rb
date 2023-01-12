class Public::FavoritesController < ApplicationController
  def create
    @subject = Subject.find(params[:subject_id])
    @answer = Answer.find(params[:answer_id])
    favorite = @answer.favorites.new(user_id: current_user.id)
    favorite.save
    # app/views/public/user_subject_answer_favorites/create.js.erbを参照する
  end
  
  def destroy
    @subject = Subject.find(params[:subject_id])
    @answer = Answer.find(params[:answer_id])
    favorite = @answer.favorites.find_by(user_id: current_user.id)
    favorite.destroy
    # app/views/public/user_subject_answer_favorites/destroy.js.erbを参照する
  end
end
