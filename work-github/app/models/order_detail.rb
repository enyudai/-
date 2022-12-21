class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  #admin　側
  # 制作ステータス（0=着手不可/ 1=製作待ち/ 2=製作中 / 3=製作完了）
  enum production_status: { wrong: 0, waiting: 1, making: 2, completed: 3 }
end
