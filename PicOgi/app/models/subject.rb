class Subject < ApplicationRecord
  #attr_accessor :subject_image_cache
  belongs_to :user
  
  has_many :user_subject_answers
  has_many :users, through: :user_subject_answers
  has_one_attached :subject_image
  
end
