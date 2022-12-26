class CartItem < ApplicationRecord

  belongs_to :item
  belongs_to :customer
  has_one_attached :image

  validates :volume, presence: true
  validates :item_id, presence: true
  validates :customer_id, presence: true

  def subtotal
    item.with_tax_price * volume
  end

end
