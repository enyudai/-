class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
  
  enum delivery_method: { user_address: 0, registered_address: 1, new_address: 2 }
  
  has_many :order_details, dependent: :destroy
  belongs_to :customers
end
