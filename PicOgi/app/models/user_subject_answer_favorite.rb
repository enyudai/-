class UserSubjectAnswerFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :user_subject_answer
end
