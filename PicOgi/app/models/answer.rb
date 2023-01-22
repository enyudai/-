class Answer < ApplicationRecord
   has_many :favorites, dependent: :destroy 
  # has_many :users, through: :favorites
   
   # has_many :reports, dependent: :destroy 
   
   belongs_to :user
   belongs_to :subject
   
   def favorited_by?(user)
    favorites.exists?(user_id: user.id)
   end
   
#   # 検索
#     def self.search(search)
#         if search != ""
#           Answer.joins(:user, :subject).where(['answer LIKE(?) OR users.nickname LIKE(?) OR subjects.title LIKE(?) OR subjects.theme LIKE(?) ', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"])
#         else
#           Answer.includes(:user).order('created_at DESC')
#         end
#     end
   
end
