class Subject < ApplicationRecord

  belongs_to :user
  
  has_many :answers
  has_many :users, through: :answers
  has_one_attached :subject_image
  
end
