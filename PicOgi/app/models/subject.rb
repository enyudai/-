class Subject < ApplicationRecord

  belongs_to :user
  
  has_many :answers, dependent: :destroy
  has_many :users, through: :answers
  
  has_many :subject_tags, dependent: :destroy
  has_many :tags, through: :subject_tags
  
  has_many :reports, dependent: :destroy
  
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
  
  #save_tagを作成
  def save_tag(sent_tags)
  # タグが存在していれば、タグの名前を配列として全て取得
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    old_tags = current_tags
    # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
    new_tags = sent_tags

    # 古いタグを消す
     self.tags.destroy_all
     
    # old_tags.each do |old|
    #   self.tags.delete Tag.find_by(name: old)
    # end

    # 新しいタグを保存
    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(name: new)
      self.tags << new_post_tag
   end
  end
  
end
