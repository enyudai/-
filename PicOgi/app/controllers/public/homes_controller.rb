class Public::HomesController < ApplicationController
  def top
     @answers = Answer.all
     @all_ranks = @answers.find(Favorite.group(:answer_id).order('count(answer_id) desc').limit(10).pluck(:answer_id))
  end

  def about
  end
end
