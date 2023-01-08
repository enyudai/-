class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :subjects, dependent: :destroy 
  has_many :good_marks, dependent: :destroy 
  has_many :answers, dependent: :destroy
         
end
