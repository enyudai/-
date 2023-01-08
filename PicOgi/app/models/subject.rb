class Subject < ApplicationRecord
  has_many :answers, dependent: :destroy
  belongs_to :user
end
