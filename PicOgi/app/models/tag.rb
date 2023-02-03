class Tag < ApplicationRecord
  
  has_many :subject_tags
  has_many :subjects, through: :subject_tags
  
end
