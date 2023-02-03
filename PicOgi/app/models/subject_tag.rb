class SubjectTag < ApplicationRecord
  
  belongs_to :tag
  belongs_to :subject
  
end
