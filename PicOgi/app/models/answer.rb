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
    def self.search(search)
        if search != ""
          Answer.joins(:users, :subjects).where(['answer LIKE(?) OR answer.users.nickname LIKE(?) OR answer.subjects LIKE(?) ', "%#{search}%", "%#{search}%", "%#{search}%"])
        else
          Answer.includes(:user).order('created_at DESC')
        end
    end
   
end
