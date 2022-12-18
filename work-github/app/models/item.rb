class Item < ApplicationRecord

  has_many :cart_items
  has_many :order_details
  belongs_to :genre
  has_one_attached :image


  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end


end
