class Answer < ApplicationRecord
  has_many :good_marks, dependent: :destroy
  belongs_to :user
  belongs_to :subject
end
