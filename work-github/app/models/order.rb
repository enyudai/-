class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum reception_status: { waiting: 0, check: 1, making: 2, prepare: 3,  shiped: 4 }
end
