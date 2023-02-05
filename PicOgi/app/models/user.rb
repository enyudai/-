class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :subjects, dependent: :destroy 
  
  has_many :favorites
  
  has_many :answers, dependent: :destroy 
  has_many :answered_subjects, through: :answers, source: :subject
  
  has_many :reports, dependent: :destroy 
  
  has_one_attached :profile_image
  
  #ニックネーム、メールアドレスを登録する際に必須で入力
  validates :nickname, presence: true
  validates :email, presence: true
  
  def get_profile_image(width, height)
    unless profile_image.attached?
       file_path = Rails.root.join('app/assets/images/no_image.jpg')
       profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
  #find_or_create_byは、データの検索と作成を自動的に判断して処理を行う、Railsのメソッド
  #SecureRandom.urlsafe_base64は、ランダムな文字列を生成するRubyのメソッド
  def self.guest
    find_or_create_by!(nickname: 'guestuser' ,email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.nickname = "guestuser"
    end
  end
  
  #検索
  def self.search(search)
    if search != ""
      User.includes(:subjects, :answers).where('users.nickname LIKE ? OR subjects.title LIKE ? OR subjects.theme LIKE ? OR answers.answer LIKE ?',
                                               "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%").references(:subjects, :answers)
    else
      User.order('created_at DESC')
    end
  end
  
end
