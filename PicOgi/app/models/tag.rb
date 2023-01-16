class Tag < ApplicationRecord
  has_many :subject_tags, dependent: :destroy
  has_many :subjects, through: :subject_tags
end
