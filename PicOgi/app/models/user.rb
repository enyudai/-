class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :subjects, dependent: :destroy 
  has_many :user_subject_answers, through: :user_subject_answer_favorites 
  has_many :subjects, through: :user_subject_answers 
  has_one_attached :profile_image
end
