class Public::HomesController < ApplicationController
  def top
     @answers = Answer.page(params[:page])
    # @all_ranks = Answer.find(Favorite.group(:answer_id).order('count(answer_id) desc').limit(10).pluck(:answer_id))
    @all_ranks = Answer.where(id: Favorite.group(:answer_id).order('count(answer_id) desc').limit(10).pluck(:answer_id)).page(params[:page])
  end

  def about
  end
end
