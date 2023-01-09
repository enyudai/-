class Subject < ApplicationRecord
  belongs_to :user
  has_many :users, through: :user_subject_answers
  has_one_attached :subject_image
end
