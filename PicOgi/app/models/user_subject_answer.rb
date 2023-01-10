class UserSubjectAnswer < ApplicationRecord
   has_many :user_subject_answer_favorites
   has_many :users, through: :user_subject_answer_favorites
   
   belongs_to :user
   belongs_to :subject
end
