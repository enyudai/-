class Subject < ApplicationRecord

  belongs_to :user
  
  has_many :answers
  has_many :users, through: :answers
  has_one_attached :subject_image
  
  #タイトル、お題、期限、お題画像を投稿する際に必須で入力
  validates :title, presence: true
  validates :theme, presence: true
  validates :time_limit, presence: true
  validates :subject_image, presence: true
  
  #お題写真をwidth,heightで表示
  def get_subject_image(width, height)
      subject_image.variant(resize_to_limit: [width, height]).processed
  end
  
end
