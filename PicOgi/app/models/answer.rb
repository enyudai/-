class Answer < ApplicationRecord
   has_many :favorites
  # has_many :users, through: :favorites
   
   # has_many :reports, dependent: :destroy 
   
   belongs_to :user
   belongs_to :subject
   
   def favorited_by?(user)
    favorites.exists?(user_id: user.id)
   end
   
   # 検索
  def self.looks(search, word)
    if search == "partial_match"
      @answer = Answer.where("answer.nickname LIKE?","%#{word}%")
    elsif search == "partial_match"
      @answer = Answer.where("answer LIKE?","%#{word}%")
    else
      @answers = Answer.all
    end
  end
   
end
