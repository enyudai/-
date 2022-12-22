class Order < ApplicationRecord
  #public側
  enum payment: { credit_card: 0, transfer: 1 }
  
  enum delivery_method: { user_address: 0, registered_address: 1, new_address: 2 }
  
  has_many :order_details, dependent: :destroy
  belongs_to :customer
  
  #admin側
  #受注ステータス (0==>入金待ち,  1==>入金確認、2==>製作中, 3==>発送準備中 , 4==>発送済み)
  enum reception_status: { payment_waiting: 0, payment_confirmation: 1, in_production: 2, preparing_delivery: 3, delivered: 4  }
  
  
  def subtotal
    item.with_tax_price * volume
  end
  
end
