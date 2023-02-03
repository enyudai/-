class Public::HomesController < ApplicationController
  
  def top
    @all_ranks = Answer.where(id: Favorite.group(:answer_id).order('count(answer_id) desc').limit(10).pluck(:answer_id)).page(params[:page]).per(6)
  end

  def about
  end
  
  def how
  end
  
end
